Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1Ot4tm-00048N-8W
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 22:36:10 +0200
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 392A0406
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Sep 2010 16:35:31 -0400 (EDT)
Received: from frontend2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Tue, 07 Sep 2010 16:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type:content-transfer-encoding;
	s=smtpout; bh=1uF+/2f0hMo2/g8lSPb7WTFifcA=;
	b=RX6S4maihjmFB3wkUaZQLJ1TPfRuUoLgAZgMYYG5e+OQqJj0VoVCdkMXaM/ujiTAjzsFsBpLPytM2j9EhjiB98GMd1Ni9dQU5M6qPPlwOS0aPIb6FLD//wyfpPnHBBFCiL8QWP2AUxEytxwyNscduGFNt+Pb8aaZYsyphX/8k5M=
X-Sasl-enc: /G2EA8qyWg6V0P3KqVVRVoJtkZwHhoXL2ZemSB2UdfbG 1283891730
Received: from [192.168.1.34] (hnvr-4d078030.pool.mediaWays.net [77.7.128.48])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 8D7395E0805
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Sep 2010 16:35:30 -0400 (EDT)
Date: Tue, 7 Sep 2010 22:37:06 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201006241026.15538.marcin@juszkiewicz.com.pl>
Message-ID: <alpine.LNX.2.00.1009072235340.22847@asterix.crazy-teaparty.dyndns.org>
References: <1277307626-24691-1-git-send-email-vjensen@gmx.de>
	<alpine.LNX.2.00.1006240646500.4844@asterix.crazy-teaparty.dyndns.org>
	<4C230CE1.1010303@balister.org>
	<201006241026.15538.marcin@juszkiewicz.com.pl>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] kernel bbclass: switch to u-boot-mkimage-native
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
X-List-Received-Date: Tue, 07 Sep 2010 20:36:11 -0000
Content-Type: TEXT/PLAIN; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Jun 2010, Marcin Juszkiewicz wrote:

> Dnia czwartek, 24 czerwca 2010 o 09:44:33 Philip Balister napisa=C5=82(=
a):
>> On 06/24/2010 06:50 AM, Vitus Jensen wrote:
>
>>> Thank you!  May I get a second ACK from someone (because of stable br=
anch
>>> and class change)?
>>
>> Acked-by: Philip Balister <philip@balister.org>
>
> Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
>

And could someone please apply the patch?  It got 3 ACKs and does still=20
apply.

Best regards,
    Vitus

--=20
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


