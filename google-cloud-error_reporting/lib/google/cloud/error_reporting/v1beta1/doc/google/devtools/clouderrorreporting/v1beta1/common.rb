# Copyright 2016 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Google
  module Devtools
    module Clouderrorreporting
      module V1beta1
        # Description of a group of similar error events.
        # @!attribute [rw] name
        #   @return [String]
        #     The group resource name.
        #     Example: <code>projects/my-project-123/groups/my-groupid</code>
        # @!attribute [rw] group_id
        #   @return [String]
        #     Group IDs are unique for a given project. If the same kind of error
        #     occurs in different service contexts, it will receive the same group ID.
        # @!attribute [rw] tracking_issues
        #   @return [Array<Google::Devtools::Clouderrorreporting::V1beta1::TrackingIssue>]
        #     Associated tracking issues.
        class ErrorGroup; end

        # Information related to tracking the progress on resolving the error.
        # @!attribute [rw] url
        #   @return [String]
        #     A URL pointing to a related entry in an issue tracking system.
        #     Example: https://github.com/user/project/issues/4
        class TrackingIssue; end

        # An error event which is returned by the Error Reporting system.
        # @!attribute [rw] event_time
        #   @return [Google::Protobuf::Timestamp]
        #     Time when the event occurred as provided in the error report.
        #     If the report did not contain a timestamp, the time the error was received
        #     by the Error Reporting system is used.
        # @!attribute [rw] service_context
        #   @return [Google::Devtools::Clouderrorreporting::V1beta1::ServiceContext]
        #     The +ServiceContext+ for which this error was reported.
        # @!attribute [rw] message
        #   @return [String]
        #     The stack trace that was reported or logged by the service.
        # @!attribute [rw] context
        #   @return [Google::Devtools::Clouderrorreporting::V1beta1::ErrorContext]
        #     Data about the context in which the error occurred.
        class ErrorEvent; end

        # Describes a running service that sends errors.
        # Its version changes over time and multiple versions can run in parallel.
        # @!attribute [rw] service
        #   @return [String]
        #     An identifier of the service, such as the name of the
        #     executable, job, or Google App Engine service name. This field is expected
        #     to have a low number of values that are relatively stable over time, as
        #     opposed to +version+, which can be changed whenever new code is deployed.
        #
        #     Contains the service name for error reports extracted from Google
        #     App Engine logs or +default+ if the App Engine default service is used.
        # @!attribute [rw] version
        #   @return [String]
        #     Represents the source code version that the developer provided,
        #     which could represent a version label or a Git SHA-1 hash, for example.
        class ServiceContext; end

        # A description of the context in which an error occurred.
        # This data should be provided by the application when reporting an error,
        # unless the
        # error report has been generated automatically from Google App Engine logs.
        # @!attribute [rw] http_request
        #   @return [Google::Devtools::Clouderrorreporting::V1beta1::HttpRequestContext]
        #     The HTTP request which was processed when the error was
        #     triggered.
        # @!attribute [rw] user
        #   @return [String]
        #     The user who caused or was affected by the crash.
        #     This can be a user ID, an email address, or an arbitrary token that
        #     uniquely identifies the user.
        #     When sending an error report, leave this field empty if the user was not
        #     logged in. In this case the
        #     Error Reporting system will use other data, such as remote IP address, to
        #     distinguish affected users. See +affected_users_count+ in
        #     +ErrorGroupStats+.
        # @!attribute [rw] report_location
        #   @return [Google::Devtools::Clouderrorreporting::V1beta1::SourceLocation]
        #     The location in the source code where the decision was made to
        #     report the error, usually the place where it was logged.
        #     For a logged exception this would be the source line where the
        #     exception is logged, usually close to the place where it was
        #     caught. This value is in contrast to +Exception.cause_location+,
        #     which describes the source line where the exception was thrown.
        class ErrorContext; end

        # HTTP request data that is related to a reported error.
        # This data should be provided by the application when reporting an error,
        # unless the
        # error report has been generated automatically from Google App Engine logs.
        # @!attribute [rw] method
        #   @return [String]
        #     The type of HTTP request, such as +GET+, +POST+, etc.
        # @!attribute [rw] url
        #   @return [String]
        #     The URL of the request.
        # @!attribute [rw] user_agent
        #   @return [String]
        #     The user agent information that is provided with the request.
        # @!attribute [rw] referrer
        #   @return [String]
        #     The referrer information that is provided with the request.
        # @!attribute [rw] response_status_code
        #   @return [Integer]
        #     The HTTP response status code for the request.
        # @!attribute [rw] remote_ip
        #   @return [String]
        #     The IP address from which the request originated.
        #     This can be IPv4, IPv6, or a token which is derived from the
        #     IP address, depending on the data that has been provided
        #     in the error report.
        class HttpRequestContext; end

        # Indicates a location in the source code of the service for which
        # errors are reported.
        # This data should be provided by the application when reporting an error,
        # unless the error report has been generated automatically from Google App
        # Engine logs. All fields are optional.
        # @!attribute [rw] file_path
        #   @return [String]
        #     The source code filename, which can include a truncated relative
        #     path, or a full path from a production machine.
        # @!attribute [rw] line_number
        #   @return [Integer]
        #     1-based. 0 indicates that the line number is unknown.
        # @!attribute [rw] function_name
        #   @return [String]
        #     Human-readable name of a function or method.
        #     The value can include optional context like the class or package name.
        #     For example, +my.package.MyClass.method+ in case of Java.
        class SourceLocation; end
      end
    end
  end
end