Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1NxH7G-0001GF-Rr
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 11:55:11 +0200
Received: by ewy3 with SMTP id 3so60129ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 02:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:received:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=leh+N8kvCkvXXAnLgTt1rM40gNvGOakB2hs7ns1qqow=;
	b=FdZvysNGrH47yEHAltQNMorBHjMWEZfFmkKRRq/hd0dEc7MlwCTne5fuWyFjkxepNU
	/AkAzP5vAi8pPoY0yzzrdVKhbaWIzixuny1IMlJ5RWrm/5CQVX1cAJ2cnvXfOcEuXFJJ
	c2AwCi9/cZ6ElXfdApMnTkf5kW7+u0ma2jIZE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=ViTQ0xJSbJ6wR6nbon9QAy145YYeHTj0ICcqYH8C0YY2K1EDfJHg2xkBSCyzZ0MjV4
	XpYDISzxUz+w8CQvcv9DyRPkTRC0OaeXGN1zidBuwkcC6HosoJhtZEZpfNJCx1d+6IN7
	Lq6bO81wPkwy1uyq1Cp/4IK22cBMeTnIiiZP8=
MIME-Version: 1.0
Sender: mickael.chazaux@gmail.com
Received: by 10.213.4.70 with HTTP; Thu, 1 Apr 2010 02:51:54 -0700 (PDT)
In-Reply-To: <4BB43A16.2040708@fqingenieria.es>
References: <1269935184-21934-1-git-send-email-mchazaux@adeneo-embedded.com>
	<20100331204928.GB14197@gmail.com> <4BB43A16.2040708@fqingenieria.es>
Date: Thu, 1 Apr 2010 11:51:54 +0200
X-Google-Sender-Auth: 2d1590a560e9afe4
Received: by 10.213.50.195 with SMTP id a3mr2961570ebg.19.1270115514488; Thu, 
	01 Apr 2010 02:51:54 -0700 (PDT)
Message-ID: <z2ibc36f8ed1004010251m5df977bctdfe4510a6a8a2af@mail.gmail.com>
From: Mickael Chazaux <mchazaux@adeneo-embedded.com>
To: Jaume Ribot <jaume@fqingenieria.es>
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: mickael.chazaux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Add Freescale i.MX25 3stack support
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
X-List-Received-Date: Thu, 01 Apr 2010 09:55:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

2010/4/1 Jaume Ribot <jaume@fqingenieria.es>:
> Thanks for patch! I will try it.
> Just a comment: Any reason for not using last Freescale Linux version?
> (2.6.31)

Could you please provide a link?

Regards,

Mickael CHAZAUX

Adeneo Embedded - Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=C3=A9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41


