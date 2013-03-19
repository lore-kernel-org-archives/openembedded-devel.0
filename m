Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UI015-0001Po-KI
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Mar 2013 18:08:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 1D4A33140759
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2013 17:51:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id jMX2HApYguVI
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2013 17:51:06 +0100 (CET)
Received: from [172.22.22.61] (unknown [212.255.228.250])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 376B63140758
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2013 17:51:06 +0100 (CET)
Message-ID: <51489779.2020409@opendreambox.org>
Date: Tue, 19 Mar 2013 17:51:05 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1363688659-2222-1-git-send-email-obi@opendreambox.org>
	<54A8A3E2-58E2-4F4C-ACDC-461DE1E976FD@gmail.com>
In-Reply-To: <54A8A3E2-58E2-4F4C-ACDC-461DE1E976FD@gmail.com>
Subject: Re: [meta-networking][PATCH] autofs: update to current patchlevel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2013 17:08:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Khem,

On 19.03.2013 17:38, Khem Raj wrote:
> what kind of testing have you done on this patch set 

I mounted an nfs share and a local ext3 partition with it and reloaded
the config with SIGHUP. The last test failed before but worked with this
patchlevel.

Regards,
Andreas



