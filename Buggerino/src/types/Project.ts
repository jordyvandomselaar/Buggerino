export interface Project {
    name: string;
    global_grouping: string[];
    location_grouping: string[];
    discarded_app_versions: string[];
    discarded_errors: string[];
    url_whitelist: string[];
    ignore_old_browsers: boolean;
    ignored_browser_versions: string[];
    resolve_on_deploy: boolean;
    id: string;
    slug: string;
    api_key: string;
    is_full_view: boolean;
    release_stages: string[];
    language: string;
    created_at: Date;
    updated_at: Date;
    url: string;
    html_url: string;
    errors_url: string;
    events_url: string;
    open_error_count: number;
    collaborators_count: string;
    custom_event_fields_used: number;
}
