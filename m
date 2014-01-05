Return-Path: <dv@vollmann.ch>
Received: from p-smtp-as-02.sunrise.ch (smtp.sunrise.ch [212.35.39.69])
	by mail.openembedded.org (Postfix) with ESMTP id 32D6160D78
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Jan 2014 22:29:30 +0000 (UTC)
Received: from [192.168.26.4] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by p-smtp-as-02.sunrise.ch (8.14.4/8.14.4) with ESMTP id s05MTU3a012027;
	Sun, 5 Jan 2014 23:29:30 +0100
Message-ID: <52C9DCCB.5070602@vollmann.ch>
Date: Sun, 05 Jan 2014 23:29:31 +0100
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: ASSUME_PROVIDED += sqlite3-native doesn't work
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jan 2014 22:29:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Specifying "ASSUME_PROVIDED += sqlite3-native" doesn't work,
as pseudo-native explicitely requires SQLite headers in
${STAGING_DIR_NATIVE}.
Am I missing something or is this a bug?

   Detlef

