%% The contents of this file are subject to the Mozilla Public License
%% Version 1.1 (the "License"); you may not use this file except in
%% compliance with the License. You may obtain a copy of the License at
%% http://www.mozilla.org/MPL/
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
%% License for the specific language governing rights and limitations
%% under the License.
%%
%% The Original Code is RabbitMQ.
%%
%% The Initial Developer of the Original Code is GoPivotal, Inc.
%% Copyright (c) 2007-2014 GoPivotal, Inc.  All rights reserved.
%%

-ifndef(AMQP_CLIENT_HRL).
-define(AMQP_CLIENT_HRL, true).

-include_lib("rabbit_common/include/rabbit.hrl").
-include_lib("rabbit_common/include/rabbit_framing.hrl").

-record(amqp_msg, {props = #'P_basic'{} :: #'P_basic'{} , payload = <<>> :: binary()}).

-record(amqp_params_network, {username           = <<"guest">> :: binary(),
                              password           = <<"guest">> :: binary(),
                              virtual_host       = <<"/">> :: binary(),
                              host               = "localhost" :: string() | binary(),
                              port               = undefined :: integer(),
                              channel_max        = 0 :: integer(),
                              frame_max          = 0 :: integer(),
                              heartbeat          = 0 :: integer(),
                              connection_timeout = infinity :: integer(),
                              ssl_options        = none :: term(),
                              auth_mechanisms    =
                                  [fun amqp_auth_mechanisms:plain/3,
                                   fun amqp_auth_mechanisms:amqplain/3] :: list(),
                              client_properties  = [] :: list(),
                              socket_options     = [] :: list()}).

-record(amqp_params_direct, {username          = none :: binary(),
                             password          = none :: binary(),
                             virtual_host      = <<"/">> :: binary(),
                             node              = node() :: node(),
                             adapter_info      = none :: term(),
                             client_properties = [] :: list() }).

-record(amqp_adapter_info, {host            = unknown :: string(),
                            port            = unknown :: integer(),
                            peer_host       = unknown :: string(),
                            peer_port       = unknown :: integer(),
                            name            = unknown :: binary() | string(),
                            protocol        = unknown :: binary() | string(),
                            additional_info = [] :: list() }).

-endif.
