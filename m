Return-Path: <olof.johansson@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id CE0B26D99E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 13:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 0749813ABD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 14:05:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id x0Uf8gzI166f
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 14:05:08 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 711793F20C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 14:05:08 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 568A96AE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 14:05:08 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 4BA64618
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 14:05:08 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 49D793E06F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 14:05:08 +0100 (CET)
Received: from axis.com (10.92.17.1) by xmail2.se.axis.com (10.0.5.74) with
	Microsoft SMTP Server (TLS) id 8.2.255.0; Wed, 4 Dec 2013 14:05:08 +0100
Date: Wed, 4 Dec 2013 14:05:07 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20131204130506.GB31548@axis.com>
References: <1386154747-14820-1-git-send-email-patrick.patat@innotis.org>
MIME-Version: 1.0
In-Reply-To: <1386154747-14820-1-git-send-email-patrick.patat@innotis.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-perl][PATCH] add libcrypt-openssl-rsa-perl
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
X-List-Received-Date: Wed, 04 Dec 2013 13:05:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 13-12-04 11:59 +0100, Patrick Patat wrote:
> +LICENSE = "MIT"

Where did you get MIT from? From what I can tell, it's
GPL1+/Artistic as usual. "Same as perl"

Regards,
-- 
olofjn

