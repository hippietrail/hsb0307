//!-----------------------------------------------------------------------
//! Copyright (C) Microsoft Corporation. All rights reserved.
//!-----------------------------------------------------------------------
//! MicrosoftAjaxWebForms.js
//! Microsoft AJAX ASP.NET WebForms Framework.

// Partial Rendering

Type.registerNamespace('Sys.WebForms');


Sys.WebForms.BeginRequestEventArgs = function Sys$WebForms$BeginRequestEventArgs(request, postBackElement) {
    /// <param name="request" type="Sys.Net.WebRequest"></param>
    /// <param name="postBackElement" domElement="true"></param>
    var e = Function._validateParams(arguments, [
        {name: "request", type: Sys.Net.WebRequest},
        {name: "postBackElement", domElement: true}
    ]);
    if (e) throw e;


    Sys.WebForms.BeginRequestEventArgs.initializeBase(this);
    this._request = request;
    this._postBackElement = postBackElement;
}


    function Sys$WebForms$BeginRequestEventArgs$get_postBackElement() {
        /// <value domElement="true"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._postBackElement;
    }

    function Sys$WebForms$BeginRequestEventArgs$get_request() {
        /// <value type="Sys.Net.WebRequest"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._request;
    }
Sys.WebForms.BeginRequestEventArgs.prototype = {
    get_postBackElement: Sys$WebForms$BeginRequestEventArgs$get_postBackElement,

    get_request: Sys$WebForms$BeginRequestEventArgs$get_request
}

Sys.WebForms.BeginRequestEventArgs.registerClass('Sys.WebForms.BeginRequestEventArgs', Sys.EventArgs);

Sys.WebForms.EndRequestEventArgs = function Sys$WebForms$EndRequestEventArgs(error, dataItems, response) {
    /// <param name="error" type="Error" mayBeNull="true"></param>
    /// <param name="dataItems" type="Object" mayBeNull="true"></param>
    /// <param name="response" type="Sys.Net.WebRequestExecutor"></param>
    var e = Function._validateParams(arguments, [
        {name: "error", type: Error, mayBeNull: true},
        {name: "dataItems", type: Object, mayBeNull: true},
        {name: "response", type: Sys.Net.WebRequestExecutor}
    ]);
    if (e) throw e;


    Sys.WebForms.EndRequestEventArgs.initializeBase(this);
    this._errorHandled = false;
    this._error = error;
    // Need to use "new Object()" instead of "{}", since the latter breaks code coverage.
    this._dataItems = dataItems || new Object();
    this._response = response;
}


    function Sys$WebForms$EndRequestEventArgs$get_dataItems() {
        /// <value type="Object"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._dataItems;
    }

    function Sys$WebForms$EndRequestEventArgs$get_error() {
        /// <value type="Error"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._error;
    }

    function Sys$WebForms$EndRequestEventArgs$get_errorHandled() {
        /// <value type="Boolean"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._errorHandled;
    }
    function Sys$WebForms$EndRequestEventArgs$set_errorHandled(value) {
        var e = Function._validateParams(arguments, [{name: "value", type: Boolean}]);
        if (e) throw e;

        this._errorHandled = value;
    }

    function Sys$WebForms$EndRequestEventArgs$get_response() {
        /// <value type="Sys.Net.WebRequestExecutor"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._response;
    }
Sys.WebForms.EndRequestEventArgs.prototype = {
    get_dataItems: Sys$WebForms$EndRequestEventArgs$get_dataItems,

    get_error: Sys$WebForms$EndRequestEventArgs$get_error,

    get_errorHandled: Sys$WebForms$EndRequestEventArgs$get_errorHandled,
    set_errorHandled: Sys$WebForms$EndRequestEventArgs$set_errorHandled,

    get_response: Sys$WebForms$EndRequestEventArgs$get_response
}

Sys.WebForms.EndRequestEventArgs.registerClass('Sys.WebForms.EndRequestEventArgs', Sys.EventArgs);

Sys.WebForms.InitializeRequestEventArgs = function Sys$WebForms$InitializeRequestEventArgs(request, postBackElement) {
    /// <param name="request" type="Sys.Net.WebRequest"></param>
    /// <param name="postBackElement" domElement="true"></param>
    var e = Function._validateParams(arguments, [
        {name: "request", type: Sys.Net.WebRequest},
        {name: "postBackElement", domElement: true}
    ]);
    if (e) throw e;


    Sys.WebForms.InitializeRequestEventArgs.initializeBase(this);
    this._request = request;
    this._postBackElement = postBackElement;
}


    function Sys$WebForms$InitializeRequestEventArgs$get_postBackElement() {
        /// <value domElement="true"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._postBackElement;
    }

    function Sys$WebForms$InitializeRequestEventArgs$get_request() {
        /// <value type="Sys.Net.WebRequest"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._request;
    }
Sys.WebForms.InitializeRequestEventArgs.prototype = {
    get_postBackElement: Sys$WebForms$InitializeRequestEventArgs$get_postBackElement,

    get_request: Sys$WebForms$InitializeRequestEventArgs$get_request
}

Sys.WebForms.InitializeRequestEventArgs.registerClass('Sys.WebForms.InitializeRequestEventArgs', Sys.CancelEventArgs);

Sys.WebForms.PageLoadedEventArgs = function Sys$WebForms$PageLoadedEventArgs(panelsUpdated, panelsCreated, dataItems) {
    /// <param name="panelsUpdated" type="Array"></param>
    /// <param name="panelsCreated" type="Array"></param>
    /// <param name="dataItems" type="Object" mayBeNull="true"></param>
    var e = Function._validateParams(arguments, [
        {name: "panelsUpdated", type: Array},
        {name: "panelsCreated", type: Array},
        {name: "dataItems", type: Object, mayBeNull: true}
    ]);
    if (e) throw e;

    Sys.WebForms.PageLoadedEventArgs.initializeBase(this);

    this._panelsUpdated = panelsUpdated;
    this._panelsCreated = panelsCreated;
    // Need to use "new Object()" instead of "{}", since the latter breaks code coverage.
    this._dataItems = dataItems || new Object();
}


    function Sys$WebForms$PageLoadedEventArgs$get_dataItems() {
        /// <value type="Object"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._dataItems;
    }

    function Sys$WebForms$PageLoadedEventArgs$get_panelsCreated() {
        /// <value type="Array"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._panelsCreated;
    }

    function Sys$WebForms$PageLoadedEventArgs$get_panelsUpdated() {
        /// <value type="Array"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._panelsUpdated;
    }
Sys.WebForms.PageLoadedEventArgs.prototype = {
    get_dataItems: Sys$WebForms$PageLoadedEventArgs$get_dataItems,

    get_panelsCreated: Sys$WebForms$PageLoadedEventArgs$get_panelsCreated,

    get_panelsUpdated: Sys$WebForms$PageLoadedEventArgs$get_panelsUpdated
}

Sys.WebForms.PageLoadedEventArgs.registerClass('Sys.WebForms.PageLoadedEventArgs', Sys.EventArgs);

Sys.WebForms.PageLoadingEventArgs = function Sys$WebForms$PageLoadingEventArgs(panelsUpdating, panelsDeleting, dataItems) {
    /// <param name="panelsUpdating" type="Array"></param>
    /// <param name="panelsDeleting" type="Array"></param>
    /// <param name="dataItems" type="Object" mayBeNull="true"></param>
    var e = Function._validateParams(arguments, [
        {name: "panelsUpdating", type: Array},
        {name: "panelsDeleting", type: Array},
        {name: "dataItems", type: Object, mayBeNull: true}
    ]);
    if (e) throw e;

    Sys.WebForms.PageLoadingEventArgs.initializeBase(this);

    this._panelsUpdating = panelsUpdating;
    this._panelsDeleting = panelsDeleting;
    // Need to use "new Object()" instead of "{}", since the latter breaks code coverage.
    this._dataItems = dataItems || new Object();
}


    function Sys$WebForms$PageLoadingEventArgs$get_dataItems() {
        /// <value type="Object"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._dataItems;
    }

    function Sys$WebForms$PageLoadingEventArgs$get_panelsDeleting() {
        /// <value type="Array"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._panelsDeleting;
    }

    function Sys$WebForms$PageLoadingEventArgs$get_panelsUpdating() {
        /// <value type="Array"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._panelsUpdating;
    }
Sys.WebForms.PageLoadingEventArgs.prototype = {
    get_dataItems: Sys$WebForms$PageLoadingEventArgs$get_dataItems,

    get_panelsDeleting: Sys$WebForms$PageLoadingEventArgs$get_panelsDeleting,

    get_panelsUpdating: Sys$WebForms$PageLoadingEventArgs$get_panelsUpdating
}

Sys.WebForms.PageLoadingEventArgs.registerClass('Sys.WebForms.PageLoadingEventArgs', Sys.EventArgs);
Sys.WebForms.PageRequestManager = function Sys$WebForms$PageRequestManager() {
    this._form = null;
    this._updatePanelIDs = null;
    this._updatePanelClientIDs = null;
    this._oldUpdatePanelIDs = null;
    this._childUpdatePanelIDs = null;
    this._panelsToRefreshIDs = null;
    this._updatePanelHasChildrenAsTriggers = null;
    this._asyncPostBackControlIDs = null;
    this._asyncPostBackControlClientIDs = null;
    this._postBackControlIDs = null;
    this._postBackControlClientIDs = null;
    this._scriptManagerID = null;
    this._pageLoadedHandler = null;

    this._additionalInput = null;
    this._onsubmit = null;
    this._onSubmitStatements = [];
    this._originalDoPostBack = null;
    this._postBackSettings = null;
    this._request = null;
    this._onFormSubmitHandler = null;
    this._onFormElementClickHandler = null;
    this._onWindowUnloadHandler = null;
    this._asyncPostBackTimeout = null;

    this._controlIDToFocus = null;
    this._scrollPosition = null;
    this._dataItems = null;
    this._response = null;
    this._processingRequest = false;
    this._scriptDisposes = {};
}



    function Sys$WebForms$PageRequestManager$_get_eventHandlerList() {
        if (!this._events) {
            this._events = new Sys.EventHandlerList();
        }
        return this._events;
    }

    function Sys$WebForms$PageRequestManager$get_isInAsyncPostBack() {
        /// <value type="Boolean"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._request !== null;
    }


    function Sys$WebForms$PageRequestManager$add_beginRequest(handler) {
        var e = Function._validateParams(arguments, [{name: "handler", type: Function}]);
        if (e) throw e;

        this._get_eventHandlerList().addHandler("beginRequest", handler);
    }
    function Sys$WebForms$PageRequestManager$remove_beginRequest(handler) {
        var e = Function._validateParams(arguments, [{name: "handler", type: Function}]);
        if (e) throw e;

        this._get_eventHandlerList().removeHandler("beginRequest", handler);
    }

    function Sys$WebForms$PageRequestManager$add_endRequest(handler) {
        var e = Function._validateParams(arguments, [{name: "handler", type: Function}]);
        if (e) throw e;

        this._get_eventHandlerList().addHandler("endRequest", handler);
    }
    function Sys$WebForms$PageRequestManager$remove_endRequest(handler) {
        var e = Function._validateParams(arguments, [{name: "handler", type: Function}]);
        if (e) throw e;

        this._get_eventHandlerList().removeHandler("endRequest", handler);
    }

    function Sys$WebForms$PageRequestManager$add_initializeRequest(handler) {
        var e = Function._validateParams(arguments, [{name: "handler", type: Function}]);
        if (e) throw e;

        this._get_eventHandlerList().addHandler("initializeRequest", handler);
    }
    function Sys$WebForms$PageRequestManager$remove_initializeRequest(handler) {
        var e = Function._validateParams(arguments, [{name: "handler", type: Function}]);
        if (e) throw e;

        this._get_eventHandlerList().removeHandler("initializeRequest", handler);
    }

    function Sys$WebForms$PageRequestManager$add_pageLoaded(handler) {
        var e = Function._validateParams(arguments, [{name: "handler", type: Function}]);
        if (e) throw e;

        this._get_eventHandlerList().addHandler("pageLoaded", handler);
    }
    function Sys$WebForms$PageRequestManager$remove_pageLoaded(handler) {
        var e = Function._validateParams(arguments, [{name: "handler", type: Function}]);
        if (e) throw e;

        this._get_eventHandlerList().removeHandler("pageLoaded", handler);
    }

    function Sys$WebForms$PageRequestManager$add_pageLoading(handler) {
        var e = Function._validateParams(arguments, [{name: "handler", type: Function}]);
        if (e) throw e;

        this._get_eventHandlerList().addHandler("pageLoading", handler);
    }
    function Sys$WebForms$PageRequestManager$remove_pageLoading(handler) {
        var e = Function._validateParams(arguments, [{name: "handler", type: Function}]);
        if (e) throw e;

        this._get_eventHandlerList().removeHandler("pageLoading", handler);
    }

    function Sys$WebForms$PageRequestManager$abortPostBack() {
        if (!this._processingRequest && this._request) {
            this._request.get_executor().abort();
            this._request = null;
        }
    }

    function Sys$WebForms$PageRequestManager$_createPageRequestManagerTimeoutError() {
        // Creates a PageRequestManagerTimeoutException representing a request that timed out.
        var displayMessage = "Sys.WebForms.PageRequestManagerTimeoutException: " + Sys.WebForms.Res.PRM_TimeoutError;
        var e = Error.create(displayMessage, {name: 'Sys.WebForms.PageRequestManagerTimeoutException'});
        e.popStackFrame();
        return e;
    }

    function Sys$WebForms$PageRequestManager$_createPageRequestManagerServerError(httpStatusCode, message) {
        // Creates a PageRequestManagerServerErrorException representing an error that occurred on the server.
        var displayMessage = message || ("Sys.WebForms.PageRequestManagerServerErrorException: " + String.format(Sys.WebForms.Res.PRM_ServerError, httpStatusCode));
        var e = Error.create(displayMessage, {
            name: 'Sys.WebForms.PageRequestManagerServerErrorException',
            httpStatusCode: httpStatusCode
        });
        e.popStackFrame();
        return e;
    }

    function Sys$WebForms$PageRequestManager$_createPageRequestManagerParserError(parserErrorMessage) {
        // Creates a PageRequestManagerParserErrorException representing a parser error that occurred while processing a response from the server.
        var displayMessage = "Sys.WebForms.PageRequestManagerParserErrorException: " + String.format(Sys.WebForms.Res.PRM_ParserError, parserErrorMessage);
        var e = Error.create(displayMessage, {name: 'Sys.WebForms.PageRequestManagerParserErrorException'});
        e.popStackFrame();
        return e;
    }

    function Sys$WebForms$PageRequestManager$_createPostBackSettings(async, panelID, sourceElement) {
Sys.Debug.assert(async ? ((panelID !== null) && (panelID.length > 0)) : true, 'panelID should be specified if async is true');
        return { async:async, panelID:panelID, sourceElement:sourceElement };
    }

    function Sys$WebForms$PageRequestManager$_convertToClientIDs(source, destinationIDs, destinationClientIDs) {
        if (source) {
            for (var i = 0; i < source.length; i++) {
                Array.add(destinationIDs, source[i]);
                Array.add(destinationClientIDs, this._uniqueIDToClientID(source[i]));
            }
        }
    }

    function Sys$WebForms$PageRequestManager$_decodeString(encodedValue) {
        return encodedValue.replace(/\\\u00FF\\/g, "\u0000").replace(/\u00FF\u00FF/g, "\u00FF");
    }

    function Sys$WebForms$PageRequestManager$_destroyTree(element) {
        // We only need to walk into children collections if this node is an element
        if (element.nodeType === 1) {
            // We can't just set innerHTML to "" because we have to walk through
            // all children in order to dispose script that may be associated with them.
            var childNodes = element.childNodes;
            for (var i = childNodes.length - 1; i >= 0; i--) {
                var node = childNodes[i];
                if (node.nodeType === 1) {
                    if (node.dispose && typeof(node.dispose) === "function") {
                        node.dispose();
                    }
                    else if (node.control && typeof(node.control.dispose) === "function") {
                        node.control.dispose();
                    }
                    var behaviors = Sys.UI.Behavior.getBehaviors(node);
                    for (var j = behaviors.length - 1; j >= 0; j--) {
                        behaviors[j].dispose();
                    }
                    this._destroyTree(node);
                }
            }
        }
    }

    function Sys$WebForms$PageRequestManager$dispose() {
        if (this._form) {
            Sys.UI.DomEvent.removeHandler(this._form, 'submit', this._onFormSubmitHandler);
            Sys.UI.DomEvent.removeHandler(this._form, 'click', this._onFormElementClickHandler);
            Sys.UI.DomEvent.removeHandler(window, 'unload', this._onWindowUnloadHandler);
            Sys.UI.DomEvent.removeHandler(window, 'load', this._pageLoadedHandler);
        }

        if (this._originalDoPostBack) {
            window.__doPostBack = this._originalDoPostBack;
            this._originalDoPostBack = null;
        }

        this._form = null;
        this._updatePanelIDs = null;
        this._oldUpdatePanelIDs = null;
        this._childUpdatePanelIDs = null;
        this._updatePanelClientIDs = null;
        this._asyncPostBackControlIDs = null;
        this._asyncPostBackControlClientIDs = null;
        this._postBackControlIDs = null;
        this._postBackControlClientIDs = null;
        this._asyncPostBackTimeout = null;
        this._scrollPosition = null;
        this._dataItems = null;
    }


    function Sys$WebForms$PageRequestManager$_doPostBack(eventTarget, eventArgument) {
        this._additionalInput = null;

        var form = this._form;
        if (form.action !== form._initialAction) {
            // Allow the default form submit to take place. Since the current
            // form action is different from the initial one, it's a cross-page postback.
            this._postBackSettings = this._createPostBackSettings(false, null, null);
        }
        else {
            // If it's not a cross-page post, see if we can find the DOM element that caused the postback
            var clientID = this._uniqueIDToClientID(eventTarget);
            var postBackElement = document.getElementById(clientID);
            if (!postBackElement) {
                // If the control has no matching DOM element we look for an exact
                // match from RegisterAsyncPostBackControl or RegisterPostBackControl.
                // If we can't find anything about it then we do a search based on
                // naming containers to still try and find a match.
                if (Array.contains(this._asyncPostBackControlIDs, eventTarget)) {
                    // Exact match for async postback
                    this._postBackSettings = this._createPostBackSettings(true, this._scriptManagerID + '|' + eventTarget, null);
                }
                else {
                    if (Array.contains(this._postBackControlIDs, eventTarget)) {
                        // Exact match for regular postback
                        this._postBackSettings = this._createPostBackSettings(false, null, null);
                    }
                    else {
                        // Find nearest element based on UniqueID in case the element calling
                        // __doPostBack doesn't have an ID. GridView does this for its Update
                        // button and without this we can't do async postbacks.
                        var nearestUniqueIDMatch = this._findNearestElement(eventTarget);
                        if (nearestUniqueIDMatch) {
                            // We found a related parent element, so walk up the DOM to find out what kind
                            // of postback we should do.
                            this._postBackSettings = this._getPostBackSettings(nearestUniqueIDMatch, eventTarget);
                        }
                        else {
                            // Can't find any DOM element at all related to the eventTarget,
                            // so we just give up and do a regular postback.
                            this._postBackSettings = this._createPostBackSettings(false, null, null);
                        }
                    }
                }
            }
            else {
                // The element was found, so walk up the DOM to find out what kind
                // of postback we should do.
                this._postBackSettings = this._getPostBackSettings(postBackElement, eventTarget);
            }
        }

        if (!this._postBackSettings.async) {
            // Temporarily restore the form's onsubmit handler expando while calling
            // the original ASP.NET 2.0 __doPostBack() function.
            form.onsubmit = this._onsubmit;
            this._originalDoPostBack(eventTarget, eventArgument);
            form.onsubmit = null;
            return;
        }

        form.__EVENTTARGET.value = eventTarget;
        form.__EVENTARGUMENT.value = eventArgument;
        this._onFormSubmit();
    }

    function Sys$WebForms$PageRequestManager$_elementContains(container, element) {
        while (element) {
            if (element === container) {
                return true;
            }
            element = element.parentNode;
        }
        return false;
    }

    function Sys$WebForms$PageRequestManager$_endPostBack(error, response) {
        this._processingRequest = false;

        this._request = null;
        this._additionalInput = null;

        var handler = this._get_eventHandlerList().getHandler("endRequest");
        var errorHandled = false;
        if (handler) {
            var eventArgs = new Sys.WebForms.EndRequestEventArgs(error, this._dataItems, response);
            handler(this, eventArgs);
            errorHandled = eventArgs.get_errorHandled();
        }
        this._dataItems = null;
        if (error && !errorHandled) {
            alert(error.message);
        }
    }



    function Sys$WebForms$PageRequestManager$_findNearestElement(uniqueID) {
        while (uniqueID.length > 0) {
            var clientID = this._uniqueIDToClientID(uniqueID);
            var element = document.getElementById(clientID);
            if (element) {
                return element;
            }
            var indexOfLastDollar = uniqueID.lastIndexOf('$');
            if (indexOfLastDollar === -1) {
                return null;
            }
            uniqueID = uniqueID.substring(0, indexOfLastDollar);
        }
        return null;
    }

    function Sys$WebForms$PageRequestManager$_findText(text, location) {
        var startIndex = Math.max(0, location - 20);
        var endIndex = Math.min(text.length, location + 20);
        return text.substring(startIndex, endIndex);
    }

    function Sys$WebForms$PageRequestManager$_getPageLoadedEventArgs(initialLoad) {
        // -------------+------------------------------------+-----------------------
        // Situation    | In ID collections                  | In eventArg property
        // -------------+------------------------------------+-----------------------
        // Update (exp) | in panelsToRefresh                 | updated
        // Update (imp) | in new, in old, in childUP         | created
        // Create (exp) | in new, not in old, not in childUP | created
        // Create (imp) | in new, not in old, in childUP     | created
        // Delete (exp) | not in new, in old, not in childUP | ---
        // Delete (imp) | not in new, in old, in childUP     | ---
        // -------------+------------------------------------+-----------------------
        // (exp) = explicit
        // (imp) = implicit (happened as result of parent UpdatePanel updating)
        // --------------------------------------------------------------------------
        // in panelsToRefresh = updated
        // not updated, in new = created
        // else = don't care
        // --------------------------------------------------------------------------

        var updated = [];
        var created = [];

        // Default to empty array, else short circuit OR will take care of value
        var oldIDs = this._oldUpdatePanelIDs || []; // All panels before update
        var newIDs = this._updatePanelIDs; // All panels after update
        var childIDs = this._childUpdatePanelIDs || []; // Child panels created after update
        var refreshedIDs = this._panelsToRefreshIDs || []; // Parent panels created after update

        // in panelsToRefresh = updated
        for (var i = 0; i < refreshedIDs.length; i++) {
            Array.add(updated, document.getElementById(this._uniqueIDToClientID(refreshedIDs[i])));
        }

        // If the panel is in the new list and it is either the initial load
        // of the page a refreshed child, it is 'created'.
        for (var i = 0; i < newIDs.length; i++) {
            if (initialLoad || Array.indexOf(childIDs, newIDs[i]) !== -1) {
                Array.add(created, document.getElementById(this._uniqueIDToClientID(newIDs[i])));
            }
        }

        return new Sys.WebForms.PageLoadedEventArgs(updated, created, this._dataItems);
    }

    function Sys$WebForms$PageRequestManager$_getPageLoadingEventArgs() {
        // -------------+------------------------------------+-----------------------
        // Situation    | In ID collections                  | In eventArg property
        // -------------+------------------------------------+-----------------------
        // Update (exp) | in panelsToRefresh                 | updated
        // Update (imp) | in old, in new, in childUP         | deleted
        // Create (exp) | not in old, in new, not in childUP | ---
        // Create (imp) | not in old, in new, in childUP     | ---
        // Delete (exp) | in old, not in new, not in childUP | deleted
        // Delete (imp) | in old, not in new, in childUP     | deleted
        // -------------+------------------------------------+-----------------------
        // (exp) = explicit
        // (imp) = implicit (happened as result of parent UpdatePanel updating)
        // --------------------------------------------------------------------------
        // in panelsToRefresh = updated
        // not updated, (not in new or in childUP) = deleted
        // else = don't care
        // --------------------------------------------------------------------------

        var updated = [];
        var deleted = [];

        var oldIDs = this._oldUpdatePanelIDs;
        var newIDs = this._updatePanelIDs;
        var childIDs = this._childUpdatePanelIDs;
        var refreshedIDs = this._panelsToRefreshIDs;

        // in panelsToRefresh = updated
        for (var i = 0; i < refreshedIDs.length; i++) {
            Array.add(updated, document.getElementById(this._uniqueIDToClientID(refreshedIDs[i])));
        }

        // not in new or in childUP = deleted
        for (var i = 0; i < oldIDs.length; i++) {
            if (Array.indexOf(refreshedIDs, oldIDs[i]) === -1 &&
                (Array.indexOf(newIDs, oldIDs[i]) === -1 || Array.indexOf(childIDs, oldIDs[i]) > -1)) {
                Array.add(deleted, document.getElementById(this._uniqueIDToClientID(oldIDs[i])));
            }
        }

        return new Sys.WebForms.PageLoadingEventArgs(updated, deleted, this._dataItems);
    }

    function Sys$WebForms$PageRequestManager$_getPostBackSettings(element, elementUniqueID) {
Sys.Debug.assert(element ? true : false, 'panelID should be specified if async is true');

        var originalElement = element;

        // Keep track of whether we have an AsyncPostBackControl but still
        // want to see if we're inside an UpdatePanel anyway.
        var proposedSettings = null;

        // Walk up DOM hierarchy to find out the nearest container of
        // the element that caused the postback.
        while (element) {
            if (element.id) {
                // First try an exact match for async postback, regular postback, or UpdatePanel
                if (!proposedSettings && Array.contains(this._asyncPostBackControlClientIDs, element.id)) {
                    // The element explicitly causes an async postback
                    proposedSettings = this._createPostBackSettings(true, this._scriptManagerID + '|' + elementUniqueID, originalElement);
                }
                else {
                    if (!proposedSettings && Array.contains(this._postBackControlClientIDs, element.id)) {
                        // The element explicitly doesn't cause an async postback
                        return this._createPostBackSettings(false, null, null);
                    }
                    else {
                        var indexOfPanel = Array.indexOf(this._updatePanelClientIDs, element.id);
                        if (indexOfPanel !== -1) {
                            // The element causes an async postback because it is inside an UpdatePanel
                            if (this._updatePanelHasChildrenAsTriggers[indexOfPanel]) {
                                // If it was in an UpdatePanel and the panel has ChildrenAsTriggers=true, then
                                // we do an async postback and refresh the given panel

                                // Although we do the search by looking at ClientIDs, we end
                                // up sending a UniqueID back to the server so that we can
                                // call FindControl() with it.
                                return this._createPostBackSettings(true, this._updatePanelIDs[indexOfPanel] + '|' + elementUniqueID, originalElement);
                            }
                            else {
                                // The element was inside an UpdatePanel so we do an async postback,
                                // but because it has ChildrenAsTriggers=false we don't update this panel.
                                return this._createPostBackSettings(true, this._scriptManagerID + '|' + elementUniqueID, originalElement);
                            }
                        }
                    }
                }

                // Then try near matches
                if (!proposedSettings && this._matchesParentIDInList(element.id, this._asyncPostBackControlClientIDs)) {
                    // The element explicitly causes an async postback
                    proposedSettings = this._createPostBackSettings(true, this._scriptManagerID + '|' + elementUniqueID, originalElement);
                }
                else {
                    if (!proposedSettings && this._matchesParentIDInList(element.id, this._postBackControlClientIDs)) {
                        // The element explicitly doesn't cause an async postback
                        return this._createPostBackSettings(false, null, null);
                    }
                }
            }

            element = element.parentNode;
        }

        // If we have proposed settings that means we found a match for an
        // AsyncPostBackControl but were still searching for an UpdatePanel.
        // If we got here that means we didn't find the UpdatePanel so we
        // just fall back to the original AsyncPostBackControl settings that
        // we created.
        if (!proposedSettings) {
            // The element doesn't cause an async postback
            return this._createPostBackSettings(false, null, null);
        }
        else {
            return proposedSettings;
        }
    }

    function Sys$WebForms$PageRequestManager$_getScrollPosition() {
        var d = document.documentElement;
        if (d && (this._validPosition(d.scrollLeft) || this._validPosition(d.scrollTop))) {
            return {
                x: d.scrollLeft,
                y: d.scrollTop
            };
        }
        else {
            d = document.body;
            if (d && (this._validPosition(d.scrollLeft) || this._validPosition(d.scrollTop))) {
                return {
                    x: d.scrollLeft,
                    y: d.scrollTop
                };
            }
            else {
                if (this._validPosition(window.pageXOffset) || this._validPosition(window.pageYOffset)) {
                    return {
                        x: window.pageXOffset,
                        y: window.pageYOffset
                    };
                }
                else {
                    return {
                        x: 0,
                        y: 0
                    };
                }
            }
        }
    }

    function Sys$WebForms$PageRequestManager$_initializeInternal(scriptManagerID, formElement) {
        this._scriptManagerID = scriptManagerID;

        this._form = formElement;

        // TODO: Check that we found the form

        // Remember the initial action to detect a cross-page postback
        this._form._initialAction = this._form.action;

        this._onsubmit = this._form.onsubmit;
        this._form.onsubmit = null;
        this._onFormSubmitHandler = Function.createDelegate(this, this._onFormSubmit);
        this._onFormElementClickHandler = Function.createDelegate(this, this._onFormElementClick);
        this._onWindowUnloadHandler = Function.createDelegate(this, this._onWindowUnload);
        Sys.UI.DomEvent.addHandler(this._form, 'submit', this._onFormSubmitHandler);
        Sys.UI.DomEvent.addHandler(this._form, 'click', this._onFormElementClickHandler);
        Sys.UI.DomEvent.addHandler(window, 'unload', this._onWindowUnloadHandler);

        this._originalDoPostBack = window.__doPostBack;
        // TODO: Check that there was already a __doPostBack (there should always be one since we force it on the server)
        if (this._originalDoPostBack) {
            window.__doPostBack = Function.createDelegate(this, this._doPostBack);
        }

        this._pageLoadedHandler = Function.createDelegate(this, this._pageLoadedInitialLoad);
        Sys.UI.DomEvent.addHandler(window, 'load', this._pageLoadedHandler);
    }

    function Sys$WebForms$PageRequestManager$_matchesParentIDInList(clientID, parentIDList) {
        for (var i = 0; i < parentIDList.length; i++) {
            if (clientID.startsWith(parentIDList[i] + "_")) {
                return true;
            }
        }
        return false;
    }

    function Sys$WebForms$PageRequestManager$_onFormElementClick(evt) {
        var element = evt.target;
        if (element.disabled) {
            return;
        }

        // Check if the element that was clicked on should cause an async postback
        this._postBackSettings = this._getPostBackSettings(element, element.name);


        if (element.name) {
            if (element.tagName === 'INPUT') {
                var type = element.type;
                if (type === 'submit') {
                    this._additionalInput = element.name + '=' + encodeURIComponent(element.value);
                }
                else if (type === 'image') {
                    var x = evt.offsetX;
                    var y = evt.offsetY;
                    this._additionalInput = element.name + '.x=' + x + '&' + element.name + '.y=' + y;
                }
            }
            else if ((element.tagName === 'BUTTON') && (element.name.length !== 0) && (element.type === 'submit')) {
                this._additionalInput = element.name + '=' + encodeURIComponent(element.value);
            }
        }
    }

    function Sys$WebForms$PageRequestManager$_onFormSubmit(evt) {
        var continueSubmit = true;

        // Call the statically declared form onsubmit statement if there was one
        if (this._onsubmit) {
            continueSubmit = this._onsubmit();
        }

        // If necessary, call dynamically added form onsubmit statements
        if (continueSubmit) {
            for (var i = 0; i < this._onSubmitStatements.length; i++) {
                if (!this._onSubmitStatements[i]()) {
                    continueSubmit = false;
                    break;
                }
            }
        }

        if (!continueSubmit) {
            if (evt) {
                evt.preventDefault();
            }
            return;
        }

        var form = this._form;
        if (form.action !== form._initialAction) {
            // Allow the default form submit to take place. Since the current
            // form action is different from the initial one, it's a cross-page postback.
            return;
        }

        // If the postback happened from outside an update panel, fall back
        // and do a normal postback.
        if (!this._postBackSettings.async) {
            return;
        }

        // Construct the form body
        var formBody = new Sys.StringBuilder();
        formBody.append(this._scriptManagerID + '=' + this._postBackSettings.panelID + '&');

        var count = form.elements.length;
        for (var i = 0; i < count; i++) {
            var element = form.elements[i];
            var name = element.name;
            if (typeof(name) === "undefined" || (name === null) || (name.length === 0)) {
                continue;
            }

            var tagName = element.tagName;

            if (tagName === 'INPUT') {
                var type = element.type;
                if ((type === 'text') ||
                    (type === 'password') ||
                    (type === 'hidden') ||
                    (((type === 'checkbox') || (type === 'radio')) && element.checked)) {
                    formBody.append(name);
                    formBody.append('=');
                    formBody.append(encodeURIComponent(element.value));
                    formBody.append('&');
                }
            }
            else if (tagName === 'SELECT') {
                var optionCount = element.options.length;
                for (var j = 0; j < optionCount; j++) {
                    var option = element.options[j];
                    if (option.selected) {
                        formBody.append(name);
                        formBody.append('=');
                        formBody.append(encodeURIComponent(option.value));
                        formBody.append('&');
                    }
                }
            }
            else if (tagName === 'TEXTAREA') {
                formBody.append(name);
                formBody.append('=');
                formBody.append(encodeURIComponent(element.value));
                formBody.append('&');
            }
        }

        if (this._additionalInput) {
            formBody.append(this._additionalInput);
            this._additionalInput = null;
        }

        var request = new Sys.Net.WebRequest();
        request.set_url(form.action);
        request.get_headers()['X-MicrosoftAjax'] = 'Delta=true';
        request.get_headers()['Cache-Control'] = 'no-cache';
        request.set_timeout(this._asyncPostBackTimeout);
        request.add_completed(Function.createDelegate(this, this._onFormSubmitCompleted));
        request.set_body(formBody.toString());

        var handler = this._get_eventHandlerList().getHandler("initializeRequest");
        if (handler) {
            var eventArgs = new Sys.WebForms.InitializeRequestEventArgs(request, this._postBackSettings.sourceElement);
            handler(this, eventArgs);
            continueSubmit = !eventArgs.get_cancel();
        }

        if (!continueSubmit) {
            if (evt) {
                evt.preventDefault();
            }
            return;
        }

        // Save the scroll position
        this._scrollPosition = this._getScrollPosition();


        // If we're going on to make a new request (i.e. the user didn't cancel), and
        // there's still an ongoing request, we have to abort it. If we don't then it
        // will exhaust the browser's two connections per server limit very quickly.
        this.abortPostBack();

        handler = this._get_eventHandlerList().getHandler("beginRequest");
        if (handler) {
            var eventArgs = new Sys.WebForms.BeginRequestEventArgs(request, this._postBackSettings.sourceElement);
            handler(this, eventArgs);
        }

        this._request = request;
        request.invoke();

        // Suppress the default form submit functionality
        if (evt) {
            evt.preventDefault();
        }
    }

    function Sys$WebForms$PageRequestManager$_onFormSubmitCompleted(sender, eventArgs) {
        this._processingRequest = true;

        var delimitByLengthDelimiter = '|';
        // sender is the executor object

        if (sender.get_timedOut()) {
            this._endPostBack(this._createPageRequestManagerTimeoutError(), sender);
            return;
        }

        if (sender.get_aborted()) {
            this._endPostBack(null, sender);
            return;
        }

        // If the response isn't the response to the latest request, ignore it (last one wins)
        if (!this._request || sender.get_webRequest() !== this._request) {
            return;
        }

        var errorMessage;
        var delta = [];

        // If we have an invalid status code, go into error mode
        if (sender.get_statusCode() !== 200) {
            this._endPostBack(this._createPageRequestManagerServerError(sender.get_statusCode()), sender);
            return;
        }

        // Parse the message format
        // General format: length|type|id|content|
        var reply = sender.get_responseData();
        var delimiterIndex, len, type, id, content;
        var replyIndex = 0;
        var parserErrorDetails = null;

        while (replyIndex < reply.length) {
            // length| - from index to next delimiter
            delimiterIndex = reply.indexOf(delimitByLengthDelimiter, replyIndex);
            if (delimiterIndex === -1) {
                parserErrorDetails = this._findText(reply, replyIndex);
                break;
            }
            len = parseInt(reply.substring(replyIndex, delimiterIndex), 10);
            if ((len % 1) !== 0) {
                parserErrorDetails = this._findText(reply, replyIndex);
                break;
            }
            replyIndex = delimiterIndex + 1;

            // type| - from index to next delimiter
            delimiterIndex = reply.indexOf(delimitByLengthDelimiter, replyIndex);
            if (delimiterIndex === -1) {
                parserErrorDetails = this._findText(reply, replyIndex);
                break;
            }
            type = reply.substring(replyIndex, delimiterIndex);
            replyIndex = delimiterIndex + 1;

            // id| - from index to next delimiter
            delimiterIndex = reply.indexOf(delimitByLengthDelimiter, replyIndex);
            if (delimiterIndex === -1) {
                parserErrorDetails = this._findText(reply, replyIndex);
                break;
            }
            id = reply.substring(replyIndex, delimiterIndex);
            replyIndex = delimiterIndex + 1;

            // content - the next 'len' characters after index
            if ((replyIndex + len) >= reply.length) {
                parserErrorDetails = this._findText(reply, reply.length);
                break;
            }
            content = this._decodeString(reply.substr(replyIndex, len));
            replyIndex += len;

            // terminating delimiter
            if (reply.charAt(replyIndex) !== delimitByLengthDelimiter) {
                parserErrorDetails = this._findText(reply, replyIndex);
                break;
            }

            replyIndex++;

            Array.add(delta, {type: type, id: id, content: content});
        }

        // If there was a parser error, go into error mode
        if (parserErrorDetails) {
            this._endPostBack(this._createPageRequestManagerParserError(String.format(Sys.WebForms.Res.PRM_ParserErrorDetails, parserErrorDetails)), sender);
            return;
        }


        var updatePanelNodes = [];
        var hiddenFieldNodes = [];
        var arrayDeclarationNodes = [];
        var scriptBlockNodes = [];
        var expandoNodes = [];
        var onSubmitNodes = [];
        var dataItemNodes = [];
        var dataItemJsonNodes = [];
        var scriptDisposeNodes = [];
        var asyncPostBackControlIDsNode, postBackControlIDsNode,
            updatePanelIDsNode, asyncPostBackTimeoutNode,
            childUpdatePanelIDsNode, panelsToRefreshNode, formActionNode;

        // Sort delta by type
        for (var i = 0; i < delta.length; i++) {
            var deltaNode = delta[i];
            switch (deltaNode.type) {
                case "updatePanel":
                    Array.add(updatePanelNodes, deltaNode);
                    break;
                case "hiddenField":
                    Array.add(hiddenFieldNodes, deltaNode);
                    break;
                case "arrayDeclaration":
                    Array.add(arrayDeclarationNodes, deltaNode);
                    break;
                case "scriptBlock":
                    Array.add(scriptBlockNodes, deltaNode);
                    break;
                case "expando":
                    Array.add(expandoNodes, deltaNode);
                    break;
                case "onSubmit":
                    Array.add(onSubmitNodes, deltaNode);
                    break;
                case "asyncPostBackControlIDs":
                    asyncPostBackControlIDsNode = deltaNode;
                    break;
                case "postBackControlIDs":
                    postBackControlIDsNode = deltaNode;
                    break;
                case "updatePanelIDs":
                    updatePanelIDsNode = deltaNode;
                    break;
                case "asyncPostBackTimeout":
                    asyncPostBackTimeoutNode = deltaNode;
                    break;
                case "childUpdatePanelIDs":
                    childUpdatePanelIDsNode = deltaNode;
                    break;
                case "panelsToRefreshIDs":
                    panelsToRefreshNode = deltaNode;
                    break;
                case "formAction":
                    formActionNode = deltaNode;
                    break;
                case "dataItem":
                    Array.add(dataItemNodes, deltaNode);
                    break;
                case "dataItemJson":
                    Array.add(dataItemJsonNodes, deltaNode);
                    break;
                case "scriptDispose":
                    Array.add(scriptDisposeNodes, deltaNode);
                    break;
                case "pageRedirect":
                    window.location.href = deltaNode.content;
                    return;
                case "error":
                    // The id contains the HTTP status code and the content contains the message
                    this._endPostBack(this._createPageRequestManagerServerError(Number.parseInvariant(deltaNode.id), deltaNode.content), sender);
                    return;
                case "pageTitle":
                    document.title = deltaNode.content;
                    break;
                case "focus":
                    this._controlIDToFocus = deltaNode.content;
                    break;
                default:
                    // If there was an unknown message, go into error mode
                    this._endPostBack(this._createPageRequestManagerParserError(String.format(Sys.WebForms.Res.PRM_UnknownToken, deltaNode.type)), sender);
                    return;
            }
        }

        var i;

        // Update the list of UpdatePanels and async postback controls
        if (asyncPostBackControlIDsNode && postBackControlIDsNode &&
            updatePanelIDsNode && panelsToRefreshNode &&
            asyncPostBackTimeoutNode && childUpdatePanelIDsNode) {

            this._oldUpdatePanelIDs = this._updatePanelIDs;
            var childUpdatePanelIDsString = childUpdatePanelIDsNode.content;
            this._childUpdatePanelIDs = childUpdatePanelIDsString.length ? childUpdatePanelIDsString.split(',') : [];

            var asyncPostBackControlIDsArray = this._splitNodeIntoArray(asyncPostBackControlIDsNode);
            var postBackControlIDsArray = this._splitNodeIntoArray(postBackControlIDsNode);
            var updatePanelIDsArray = this._splitNodeIntoArray(updatePanelIDsNode);
            this._panelsToRefreshIDs = this._splitNodeIntoArray(panelsToRefreshNode);

            // Validate that all the top level UpdatePanels that we plan to update exist
            // in the active document. We do this early so that we can later assume that
            // all referenced UpdatePanels exist.
            for (i = 0; i < this._panelsToRefreshIDs.length; i++) {
                var panelClientID = this._uniqueIDToClientID(this._panelsToRefreshIDs[i]);
                if (!document.getElementById(panelClientID)) {
                    this._endPostBack(Error.invalidOperation(String.format(Sys.WebForms.Res.PRM_MissingPanel, panelClientID)), sender);
                    return;
                }
            }

            var asyncPostBackTimeout = asyncPostBackTimeoutNode.content;
            this._updateControls(updatePanelIDsArray, asyncPostBackControlIDsArray, postBackControlIDsArray, asyncPostBackTimeout);
        }

        // Process data items
        this._dataItems = {};
        for (i = 0; i < dataItemNodes.length; i++) {
            var dataItemNode = dataItemNodes[i];
            this._dataItems[dataItemNode.id] = dataItemNode.content;
        }
        for (i = 0; i < dataItemJsonNodes.length; i++) {
            var dataItemJsonNode = dataItemJsonNodes[i];
            this._dataItems[dataItemJsonNode.id] = eval(dataItemJsonNode.content);
        }


        var handler = this._get_eventHandlerList().getHandler("pageLoading");
        if (handler) {
            handler(this, this._getPageLoadingEventArgs());
        }


        // Update the form action (it may have changed due to cookieless session, etc.)
        if (formActionNode) {
            this._form.action = formActionNode.content;
            // In Firefox the form's action gets immediately resolved relative
            // to the current page after setting it. Because of this we need
            // to read back the value to make sure we save the resolved value.
            this._form._initialAction = this._form.action;
        }

        // Update the rendering for each delta panel and dispose all the contents.
        // The dispose can happen either through DOM elements that have dispose
        // support or through direct dispose registrations done on the server.
        for (i = 0; i < updatePanelNodes.length; i++) {
            var deltaUpdatePanel = updatePanelNodes[i];

            var deltaPanelID = deltaUpdatePanel.id;
            var deltaPanelRendering = deltaUpdatePanel.content;

            var updatePanelElement = document.getElementById(deltaPanelID);

            if (!updatePanelElement) {
                this._endPostBack(Error.invalidOperation(String.format(Sys.WebForms.Res.PRM_MissingPanel, deltaPanelID)), sender);
                return;
            }

            this._updatePanel(updatePanelElement, deltaPanelRendering);
        }

        // Update the dispose entries
        // We have to do this after we disposed all the panels since otherwise
        // we would run the dispose scripts on the brand new markup.
        for (i = 0; i < scriptDisposeNodes.length; i++) {
            var disposePanelId = scriptDisposeNodes[i].id;
            var disposeScript = scriptDisposeNodes[i].content;
            this._registerDisposeScript(disposePanelId, disposeScript);
        }

        // Update the hidden fields
        for (i = 0; i < hiddenFieldNodes.length; i++) {
            var id = hiddenFieldNodes[i].id;
            var value = hiddenFieldNodes[i].content;

            var hiddenFieldElement = document.getElementById(id);
            if (!hiddenFieldElement) {
                // If the hidden field doesn't exist, create it
                hiddenFieldElement = document.createElement('input');
                hiddenFieldElement.id = id;
                hiddenFieldElement.name = id;
                hiddenFieldElement.type = 'hidden';
                this._form.appendChild(hiddenFieldElement);
            }
            hiddenFieldElement.value = value;
        }

        // Update array declarations
        var arrayScript = '';
        for (i = 0; i < arrayDeclarationNodes.length; i++) {
            arrayScript += "Sys.WebForms.PageRequestManager._addArrayElement('" + arrayDeclarationNodes[i].id + "', " + arrayDeclarationNodes[i].content + ");\r\n";
        }

        // Update expandos
        var expandoScript = '';
        for (i = 0; i < expandoNodes.length; i++) {
            var propertyReference = expandoNodes[i].id;
            var propertyValue = expandoNodes[i].content;
            expandoScript += propertyReference + " = " + propertyValue + "\r\n";
        }

        // Update scripts (user code may have manually inserted a script element, this will ensure we know about those).
        // This is used to detect duplicates so we don't reload scripts that have already loaded.
        Sys._ScriptLoader.readLoadedScripts();

        // Starting batch mode for component creation to allow for
        // two-pass creation and components that reference each other.
        // endCreateComponents called from _scriptsLoadComplete.
        Sys.Application.beginCreateComponents();

        var scriptLoader = Sys._ScriptLoader.getInstance();

        // Execute these dynamically created scripts through the ScriptLoader so that
        // they get executed in the global window context. If we execute them through
        // calls to eval() then they will evaluate in this function's context, which
        // is incorrect.
        if (arrayScript.length) {
            scriptLoader.queueScriptBlock(arrayScript);
        }
        if (expandoScript.length) {
            scriptLoader.queueScriptBlock(expandoScript);
        }

        for (i = 0; i < scriptBlockNodes.length; i++) {
            var scriptBlockType = scriptBlockNodes[i].id;
            switch (scriptBlockType) {
                case "ScriptContentNoTags":
                    // The content contains raw JavaScript
                    scriptLoader.queueScriptBlock(scriptBlockNodes[i].content);
                    break;
                case "ScriptContentWithTags":
                    // The content contains serialized attributes for the script tag
                    var scriptTagAttributes;
                    eval("scriptTagAttributes = " + scriptBlockNodes[i].content);

                    // Don't reload a script that's already in the DOM
                    if (scriptTagAttributes.src && Sys._ScriptLoader.isScriptLoaded(scriptTagAttributes.src)) {
                        continue;
                    }

                    scriptLoader.queueCustomScriptTag(scriptTagAttributes);
                    break;
                case "ScriptPath":
                    // Don't reload a script that's already in the DOM
                    if (Sys._ScriptLoader.isScriptLoaded(scriptBlockNodes[i].content)) {
                        continue;
                    }

                    // The content contains the URL reference of the script to load
                    scriptLoader.queueScriptReference(scriptBlockNodes[i].content);
                    break;
            }
        }

        // Update onsubmit statements
        // Create a function that calls the submit statement and otherwise returns true;
        var onSubmitStatementScript = '';
        for (var i = 0; i < onSubmitNodes.length; i++) {
            if (i === 0) {
                onSubmitStatementScript = 'Array.add(Sys.WebForms.PageRequestManager.getInstance()._onSubmitStatements, function() {\r\n';
            }

            onSubmitStatementScript += onSubmitNodes[i].content + "\r\n";
        }
        if (onSubmitStatementScript.length) {
            onSubmitStatementScript += "\r\nreturn true;\r\n});\r\n";
            scriptLoader.queueScriptBlock(onSubmitStatementScript);
        }

        // Save the sender into a member so that we can later get it from the completion callback
        this._response = sender;

        // PRM does not support load timeout
        //                      timeout, completeCallback, failedCallback, timeoutCallback
        scriptLoader.loadScripts(0, Function.createDelegate(this, this._scriptsLoadComplete), null, null);

        // Do not add code after the call to loadScripts(). If you need to do extra
        // processing after scripts are loaded, do it in _scriptsLoadComplete.
    }

    function Sys$WebForms$PageRequestManager$_onWindowUnload(evt) {
        this.dispose();
    }

    function Sys$WebForms$PageRequestManager$_pageLoaded(initialLoad) {
        var handler = this._get_eventHandlerList().getHandler("pageLoaded");
        if (handler) {
            handler(this, this._getPageLoadedEventArgs(initialLoad));
        }
        if (!initialLoad) {
            // If this isn't the first page load (i.e. we are doing an async postback), we
            // need to re-raise the Application's load event.
            Sys.Application.raiseLoad();
        }
    }

    function Sys$WebForms$PageRequestManager$_pageLoadedInitialLoad(evt) {
        this._pageLoaded(true);
    }

    function Sys$WebForms$PageRequestManager$_registerDisposeScript(panelID, disposeScript) {
        if (!this._scriptDisposes[panelID]) {
            this._scriptDisposes[panelID] = [disposeScript];
        }
        else {
            Array.add(this._scriptDisposes[panelID], disposeScript);
        }
    }

    function Sys$WebForms$PageRequestManager$_scriptsLoadComplete() {
        // This function gets called after all scripts have been loaded by the PRM.
        // It might also get called directly if there aren't any scripts to load.
        // Its purpose is to finish off the processing of a postback.

        // These two variables are used by ASP.net callbacks.
        // Because of how callbacks work, we have to re-initialize the
        // variables to an empty state so that their values don't keep
        // growing on every async postback. Then we have to re-initialize
        // the callback process.
        if (window.__theFormPostData) {
            window.__theFormPostData = "";
        }
        if (window.__theFormPostCollection) {
            window.__theFormPostCollection = [];
        }
        if (window.WebForm_InitCallback) {
            window.WebForm_InitCallback();
        }

        // Restore scroll position
        if (this._scrollPosition) {
            // window.scrollTo() is supported by IE and Firefox (and possibly Safari)
            if (window.scrollTo) {
                window.scrollTo(this._scrollPosition.x, this._scrollPosition.y);
            }
            this._scrollPosition = null;
        }

        Sys.Application.endCreateComponents();

        // Raise completion events
        this._pageLoaded(false);

        this._endPostBack(null, this._response);
        this._response = null;

        // Set focus
        if (this._controlIDToFocus) {
            var focusTarget;
            var oldContentEditableSetting;
            if (Sys.Browser.agent === Sys.Browser.InternetExplorer) {
                // IE6 and IE7 have a bug where you can't focus certain elements
                // if they've been changed in the DOM. To work around this they
                // suggested turning off contentEditable temporarily while focusing
                // the target element.
                var targetControl = $get(this._controlIDToFocus);

                var focusTarget = targetControl;
                // If the focus control isn't focusable, default to the first focusable child
                if (targetControl && (!WebForm_CanFocus(targetControl))) {
                    focusTarget = WebForm_FindFirstFocusableChild(targetControl);
                }
                // If we found the focus target and it supports contentEditable then
                // turn it off. Otherwise forget we ever tried to disable content editing.
                if (focusTarget && (typeof(focusTarget.contentEditable) !== "undefined")) {
                    oldContentEditableSetting = focusTarget.contentEditable;
                    focusTarget.contentEditable = false;
                }
                else {
                    focusTarget = null;
                }
            }
            WebForm_AutoFocus(this._controlIDToFocus);
            if (focusTarget) {
                // If we did the contentEditable hack, reset the value
                focusTarget.contentEditable = oldContentEditableSetting;
            }
            this._controlIDToFocus = null;
        }
    }

    function Sys$WebForms$PageRequestManager$_splitNodeIntoArray(node) {
        var str = node.content;
        var arr = str.length ? str.split(',') : [];
        return arr;
    }

    function Sys$WebForms$PageRequestManager$_uniqueIDToClientID(uniqueID) {
        // Convert unique IDs to client IDs by replacing all '$' with '_'
        return uniqueID.replace(/\$/g, '_');
    }

    function Sys$WebForms$PageRequestManager$_updateControls(updatePanelIDs, asyncPostBackControlIDs, postBackControlIDs, asyncPostBackTimeout) {
        if (updatePanelIDs) {
            // Parse the array that has the UniqueIDs and split the data out.
            // The array contains UniqueIDs with either a 't' or 'f' prefix
            // indicating whether the panel has ChildrenAsTriggers enabled.
            this._updatePanelIDs = new Array(updatePanelIDs.length);
            this._updatePanelClientIDs = new Array(updatePanelIDs.length);
            this._updatePanelHasChildrenAsTriggers = new Array(updatePanelIDs.length);
            for (var i = 0; i < updatePanelIDs.length; i++) {
                var realPanelID = updatePanelIDs[i].substr(1);
                var childrenAsTriggers = (updatePanelIDs[i].charAt(0) === 't');

                // The three arrays are kept in sync by index
                this._updatePanelHasChildrenAsTriggers[i] = childrenAsTriggers;
                this._updatePanelIDs[i] = realPanelID;
                this._updatePanelClientIDs[i] = this._uniqueIDToClientID(realPanelID);
            }
            this._asyncPostBackTimeout = asyncPostBackTimeout * 1000;
        }
        else {
            this._updatePanelIDs = [];
            this._updatePanelClientIDs = [];
            this._updatePanelHasChildrenAsTriggers = [];
            this._asyncPostBackTimeout = 0;
        }

        this._asyncPostBackControlIDs = [];
        this._asyncPostBackControlClientIDs = [];
        this._convertToClientIDs(asyncPostBackControlIDs, this._asyncPostBackControlIDs, this._asyncPostBackControlClientIDs);

        this._postBackControlIDs = [];
        this._postBackControlClientIDs = [];
        this._convertToClientIDs(postBackControlIDs, this._postBackControlIDs, this._postBackControlClientIDs);
    }

    function Sys$WebForms$PageRequestManager$_updatePanel(updatePanelElement, rendering) {

        for (var updatePanelID in this._scriptDisposes) {
            if (this._elementContains(updatePanelElement, document.getElementById(updatePanelID))) {
                // Run all the dispose scripts for this panel
                var disposeScripts = this._scriptDisposes[updatePanelID];
                for (var i = 0; i < disposeScripts.length; i++) {
                    eval(disposeScripts[i]);
                }

                // Remove the dispose entries for this panel
                delete this._scriptDisposes[updatePanelID];
            }
        }

        this._destroyTree(updatePanelElement);

        // Update the region with the new UpdatePanel content
        updatePanelElement.innerHTML = rendering;
    }

    function Sys$WebForms$PageRequestManager$_validPosition(position) {
        return (typeof(position) !== "undefined") && (position !== null) && (position !== 0);
    }
Sys.WebForms.PageRequestManager.prototype = {

    _get_eventHandlerList: Sys$WebForms$PageRequestManager$_get_eventHandlerList,

    get_isInAsyncPostBack: Sys$WebForms$PageRequestManager$get_isInAsyncPostBack,

    // Events
    add_beginRequest: Sys$WebForms$PageRequestManager$add_beginRequest,
    remove_beginRequest: Sys$WebForms$PageRequestManager$remove_beginRequest,

    add_endRequest: Sys$WebForms$PageRequestManager$add_endRequest,
    remove_endRequest: Sys$WebForms$PageRequestManager$remove_endRequest,

    add_initializeRequest: Sys$WebForms$PageRequestManager$add_initializeRequest,
    remove_initializeRequest: Sys$WebForms$PageRequestManager$remove_initializeRequest,

    add_pageLoaded: Sys$WebForms$PageRequestManager$add_pageLoaded,
    remove_pageLoaded: Sys$WebForms$PageRequestManager$remove_pageLoaded,

    add_pageLoading: Sys$WebForms$PageRequestManager$add_pageLoading,
    remove_pageLoading: Sys$WebForms$PageRequestManager$remove_pageLoading,

    abortPostBack: Sys$WebForms$PageRequestManager$abortPostBack,

    _createPageRequestManagerTimeoutError: Sys$WebForms$PageRequestManager$_createPageRequestManagerTimeoutError,

    _createPageRequestManagerServerError: Sys$WebForms$PageRequestManager$_createPageRequestManagerServerError,

    _createPageRequestManagerParserError: Sys$WebForms$PageRequestManager$_createPageRequestManagerParserError,

    _createPostBackSettings: Sys$WebForms$PageRequestManager$_createPostBackSettings,

    _convertToClientIDs: Sys$WebForms$PageRequestManager$_convertToClientIDs,

    _decodeString: Sys$WebForms$PageRequestManager$_decodeString,

    _destroyTree: Sys$WebForms$PageRequestManager$_destroyTree,

    dispose: Sys$WebForms$PageRequestManager$dispose,

    // New implementation of __doPostBack
    _doPostBack: Sys$WebForms$PageRequestManager$_doPostBack,

    _elementContains: Sys$WebForms$PageRequestManager$_elementContains,

    _endPostBack: Sys$WebForms$PageRequestManager$_endPostBack,

    // Finds the nearest element to the given UniqueID. If an element is not
    // found for the exact UniqueID, it walks up the parent chain to look for it.
    _findNearestElement: Sys$WebForms$PageRequestManager$_findNearestElement,

    _findText: Sys$WebForms$PageRequestManager$_findText,

    _getPageLoadedEventArgs: Sys$WebForms$PageRequestManager$_getPageLoadedEventArgs,

    _getPageLoadingEventArgs: Sys$WebForms$PageRequestManager$_getPageLoadingEventArgs,

    _getPostBackSettings: Sys$WebForms$PageRequestManager$_getPostBackSettings,

    _getScrollPosition: Sys$WebForms$PageRequestManager$_getScrollPosition,

    _initializeInternal: Sys$WebForms$PageRequestManager$_initializeInternal,

    _matchesParentIDInList: Sys$WebForms$PageRequestManager$_matchesParentIDInList,

    _onFormElementClick: Sys$WebForms$PageRequestManager$_onFormElementClick,

    _onFormSubmit: Sys$WebForms$PageRequestManager$_onFormSubmit,

    _onFormSubmitCompleted: Sys$WebForms$PageRequestManager$_onFormSubmitCompleted,

    _onWindowUnload: Sys$WebForms$PageRequestManager$_onWindowUnload,

    _pageLoaded: Sys$WebForms$PageRequestManager$_pageLoaded,

    _pageLoadedInitialLoad: Sys$WebForms$PageRequestManager$_pageLoadedInitialLoad,

    _registerDisposeScript: Sys$WebForms$PageRequestManager$_registerDisposeScript,

    _scriptsLoadComplete: Sys$WebForms$PageRequestManager$_scriptsLoadComplete,

    _splitNodeIntoArray: Sys$WebForms$PageRequestManager$_splitNodeIntoArray,

    _uniqueIDToClientID: Sys$WebForms$PageRequestManager$_uniqueIDToClientID,

    _updateControls: Sys$WebForms$PageRequestManager$_updateControls,

    _updatePanel: Sys$WebForms$PageRequestManager$_updatePanel,

    _validPosition: Sys$WebForms$PageRequestManager$_validPosition
}

Sys.WebForms.PageRequestManager.getInstance = function Sys$WebForms$PageRequestManager$getInstance() {
    /// <returns type="Sys.WebForms.PageRequestManager"></returns>
    if (arguments.length !== 0) throw Error.parameterCount();
    return Sys.WebForms.PageRequestManager._instance || null;
}

Sys.WebForms.PageRequestManager._addArrayElement = function Sys$WebForms$PageRequestManager$_addArrayElement(arrayName, arrayValue) {
    if (typeof(window[arrayName]) === "undefined") {
        // If this is a new array, create a new one with the single value
        window[arrayName] = [ arrayValue ];
    }
    else {
        // If this is an existing array, just append the item
        Array.add(window[arrayName], arrayValue);
    }
}

Sys.WebForms.PageRequestManager._initialize = function Sys$WebForms$PageRequestManager$_initialize(scriptManagerID, formElement) {
    if (Sys.WebForms.PageRequestManager.getInstance()) {
        throw Error.invalidOperation(Sys.WebForms.Res.PRM_CannotRegisterTwice);
    }
    Sys.WebForms.PageRequestManager._instance = new Sys.WebForms.PageRequestManager();
    Sys.WebForms.PageRequestManager.getInstance()._initializeInternal(scriptManagerID, formElement);
}

Sys.WebForms.PageRequestManager.registerClass('Sys.WebForms.PageRequestManager');
Sys.UI._UpdateProgress = function Sys$UI$_UpdateProgress(element) {
    Sys.UI._UpdateProgress.initializeBase(this,[element]);
    this._displayAfter = 500;
    this._dynamicLayout = true;
    this._associatedUpdatePanelId = null;
    this._beginRequestHandlerDelegate = null;
    this._startDelegate = null;
    this._endRequestHandlerDelegate = null;
    this._pageRequestManager = null;
    this._timerCookie = null;
}

    function Sys$UI$_UpdateProgress$get_displayAfter() {
        /// <value type="Number"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._displayAfter;
    }
    function Sys$UI$_UpdateProgress$set_displayAfter(value) {
        var e = Function._validateParams(arguments, [{name: "value", type: Number}]);
        if (e) throw e;

        this._displayAfter = value;
    }
    function Sys$UI$_UpdateProgress$get_dynamicLayout() {
        /// <value type="Boolean"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._dynamicLayout;
    }
    function Sys$UI$_UpdateProgress$set_dynamicLayout(value) {
        var e = Function._validateParams(arguments, [{name: "value", type: Boolean}]);
        if (e) throw e;

        this._dynamicLayout = value;
    }
    function Sys$UI$_UpdateProgress$get_associatedUpdatePanelId() {
        /// <value type="String" mayBeNull="true"></value>
        if (arguments.length !== 0) throw Error.parameterCount();
        return this._associatedUpdatePanelId;
    }
    function Sys$UI$_UpdateProgress$set_associatedUpdatePanelId(value) {
        var e = Function._validateParams(arguments, [{name: "value", type: String, mayBeNull: true}]);
        if (e) throw e;

        this._associatedUpdatePanelId = value;
    }
    function Sys$UI$_UpdateProgress$_handleBeginRequest(sender, arg) {
        var curElem = arg.get_postBackElement();
        var showProgress = !this._associatedUpdatePanelId; 
        while (!showProgress && curElem) {
            if (curElem.id && this._associatedUpdatePanelId === curElem.id) {
                showProgress = true; 
            }
            curElem = curElem.parentNode; 
        } 
        if (showProgress) {
            this._timerCookie = window.setTimeout(this._startDelegate, this._displayAfter);
        }
    }
    function Sys$UI$_UpdateProgress$_startRequest() {
        if (this._pageRequestManager.get_isInAsyncPostBack()) {
            if (this._dynamicLayout) this.get_element().style.display = 'block';
            else this.get_element().style.visibility = 'visible';
        }
        this._timerCookie = null;
    }
    function Sys$UI$_UpdateProgress$_handleEndRequest(sender, arg) {
        if (this._dynamicLayout) this.get_element().style.display = 'none';
        else this.get_element().style.visibility = 'hidden';
        if (this._timerCookie) {
            window.clearTimeout(this._timerCookie);
            this._timerCookie = null;
        }
    }
    function Sys$UI$_UpdateProgress$dispose() {
       if (this._pageRequestManager !== null) {
           this._pageRequestManager.remove_beginRequest(this._beginRequestHandlerDelegate);
           this._pageRequestManager.remove_endRequest(this._endRequestHandlerDelegate);
       }
       Sys.UI._UpdateProgress.callBaseMethod(this,"dispose");
    }
    function Sys$UI$_UpdateProgress$initialize() {
        Sys.UI._UpdateProgress.callBaseMethod(this, 'initialize');
    	this._beginRequestHandlerDelegate = Function.createDelegate(this, this._handleBeginRequest);
    	this._endRequestHandlerDelegate = Function.createDelegate(this, this._handleEndRequest);
    	this._startDelegate = Function.createDelegate(this, this._startRequest);
    	if (Sys.WebForms && Sys.WebForms.PageRequestManager) {
           this._pageRequestManager = Sys.WebForms.PageRequestManager.getInstance();
    	}
    	if (this._pageRequestManager !== null ) {
           // Review: should we throw if there's no pageRequestManager
    	    this._pageRequestManager.add_beginRequest(this._beginRequestHandlerDelegate);
    	    this._pageRequestManager.add_endRequest(this._endRequestHandlerDelegate);
    	}
    }
Sys.UI._UpdateProgress.prototype = {
    get_displayAfter: Sys$UI$_UpdateProgress$get_displayAfter,
    set_displayAfter: Sys$UI$_UpdateProgress$set_displayAfter,
    get_dynamicLayout: Sys$UI$_UpdateProgress$get_dynamicLayout,
    set_dynamicLayout: Sys$UI$_UpdateProgress$set_dynamicLayout,
    get_associatedUpdatePanelId: Sys$UI$_UpdateProgress$get_associatedUpdatePanelId,
    set_associatedUpdatePanelId: Sys$UI$_UpdateProgress$set_associatedUpdatePanelId,
    _handleBeginRequest: Sys$UI$_UpdateProgress$_handleBeginRequest,
    _startRequest: Sys$UI$_UpdateProgress$_startRequest,
    _handleEndRequest: Sys$UI$_UpdateProgress$_handleEndRequest,
    dispose: Sys$UI$_UpdateProgress$dispose,
    initialize: Sys$UI$_UpdateProgress$initialize
}
Sys.UI._UpdateProgress.registerClass('Sys.UI._UpdateProgress', Sys.UI.Control);

Sys.WebForms.Res={
'PRM_MissingPanel':'Could not find UpdatePanel with ID \'{0}\'. If it is being updated dynamically then it must be inside another UpdatePanel.',
'PRM_ServerError':'An unknown error occurred while processing the request on the server. The status code returned from the server was: {0}',
'PRM_ParserError':'The message received from the server could not be parsed.',
'PRM_TimeoutError':'The server request timed out.',
'PRM_CannotRegisterTwice':'The PageRequestManager cannot be initialized more than once.',
'PRM_UnknownToken':'Unknown token: \'{0}\'.',
'PRM_MissingPanel':'Could not find UpdatePanel with ID \'{0}\'. If it is being updated dynamically then it must be inside another UpdatePanel.',
'PRM_ServerError':'An unknown error occurred while processing the request on the server. The status code returned from the server was: {0}',
'PRM_ParserError':'The message received from the server could not be parsed. Common causes for this error are when the response is modified by calls to Response.Write(), response filters, HttpModules, or server trace is enabled.\r\nDetails: {0}',
'PRM_TimeoutError':'The server request timed out.',
'PRM_ParserErrorDetails':'Error parsing near \'{0}\'.',
'PRM_CannotRegisterTwice':'The PageRequestManager cannot be initialized more than once.'
};

if(typeof(Sys)!=='undefined')Sys.Application.notifyScriptLoaded();
