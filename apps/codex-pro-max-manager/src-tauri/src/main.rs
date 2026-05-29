#![cfg_attr(windows, windows_subsystem = "windows")]

fn main() {
    if std::env::args().any(|arg| arg == "--show-update") {
        unsafe {
            std::env::set_var("CODEX_PLUS_SHOW_UPDATE", "1");
        }
    }
    codex_pro_max_manager_lib::run();
}
