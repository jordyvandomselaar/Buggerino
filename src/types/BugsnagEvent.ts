export interface App {
    releaseStage: string;
}

export interface Code {
    [lineNumber: string]: string
}

export interface Stacktrace {
    lineNumber: number;
    file: string;
    inProject: boolean;
    method: string;
    sourceControlName: string;
    code: Code;
}

export interface Exception {
    errorClass: string;
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
