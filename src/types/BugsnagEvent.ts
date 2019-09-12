export interface App {
    releaseStage: string;
}

export interface Code {
    [line_number: string]: string
}

export interface Stacktrace {
    line_number: number;
    file: string;
    in_project: boolean;
    method: string;
    source_control_name: string;
    code?: Code;
}

export interface Exception {
    error_class: string;
    message: string;
    stacktrace: Stacktrace[];
}


export interface BugsnagEvent {
    id: string;
    is_full_report: boolean;
    url: string;
    project_url: string;
    error_id: string;
    received_at: Date;
    exceptions: Exception[];
    severity: string;
    unhandled: boolean;
    context: string;
    app: App;
}
