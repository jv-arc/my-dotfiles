import kdl
from dataclasses import dataclass
from pathlib import Path
from typing import List, Any, Callable, Optional
from collections import defaultdict

zellij_dir = Path("__file__").parent.parent
snippets_dir = Path("__file__").parent / "snippets"



TARGETS {
    "std": Target( [t for t in TARGETS.keys() if t != "std"] ,None),
    "matugen": Target(None,[
        BuildRule(build_matugen_themes, []),
    ]),
    "
}



@dataclass
class BuildRule:
    run: Callable
    args: Any

@dataclass
class Target:
    dependencies: Optional[List[Target]]
    build_rules: Optional[List[BuildRule]]

@dataclass
class Plugin:
    config_path: str
    name: str


def download_plugins():
    pass

def load_plugins():
    pass

def build_matugen_themes():
pass


def load_keybinds():
    pass


def detect_circular_dependency(root:Target)->bool:
    visited = {}
    check_list = [root]
    size_limit = 100
    while len(check_list) > 0:
        to_check = checklist[0]
        if to_check in visited:
            return False
        else:
            visited.add(to_check)
            check_list.remove(to_check)
            for t in to_check.dependencies:
                if t not in visited:
                    check_list.append(t)
                else:
                    return False
    return True
