// ==UserScript==
// @name         Perplexity Matugen Theme
// @version      2025-10-19
// @description  Loads a .json file with matugen generated colors from the computer and injects it into Perplexity
// @author       You
// @match        https://www.perplexity.ai/*
// @grant        GM_xmlhttpRequest
// @grant        GM_addStyle
// @require      https://cdnjs.cloudflare.com/ajax/libs/chroma-js/2.4.2/chroma.min.js
// ==/UserScript==

(function(){
    'use strict';

    window.addEventListener('load', function() {
      GM_xmlhttpRequest({
            method: 'GET',
            url: 'http://localhost:8090/ppx-matugen-colors.json?' + Date.now(), // Cache busting
            onload: function(response) {
                try {
                    const dynamic_colors = JSON.parse(response.responseText);
                    const root = document.documentElement.style;

                    for (const [name, hexValue] of Object.entries(dynamic_colors)){
                      const color_read = chroma(hexValue);
                      console.log(color_read.oklch());
                      const oklch_color = color_read.oklch();
                      const oklch_string = `${oklch_color[0] * 100}% ${oklch_color[1]} ${oklch_color[2]}`;
                      console.log(oklch_string);
                      root.setProperty(name, `${oklch_color[0] * 100}% ${oklch_color[1]} ${oklch_color[2]}`);
                    }
                } catch (e) {
                    console.error('Error parsing colors JSON:', e);
                }
            },
            onerror: function(error) {
                console.error('Error loading colors file:', error);
            }
        });
    });
})();
