/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package com.quorum.gauge.ext;

import org.web3j.quorum.methods.request.PrivateTransaction;

import java.math.BigInteger;
import java.util.List;

public class PrivateTransactionAsync extends PrivateTransaction {
    private String callbackUrl;

    public PrivateTransactionAsync(String from, BigInteger nonce, BigInteger gasLimit, String to, BigInteger value, String data, String privateFrom, List<String> privateFor, String callbackUrl) {
        super(from, nonce, gasLimit, to, value, data, privateFrom, privateFor);
        this.callbackUrl = callbackUrl;
    }

    public String getCallbackUrl() {
        return callbackUrl;
    }

    public void setCallbackUrl(String callbackUrl) {
        this.callbackUrl = callbackUrl;
    }
}
