Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PY59h-0008KG-P9
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 00:10:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id D1BA9314C143
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 00:09:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id LzSwhujDtlbS
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 00:09:47 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 0801E314C141
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 00:09:47 +0100 (CET)
Message-ID: <4D1BBFBA.9050300@opendreambox.org>
Date: Thu, 30 Dec 2010 00:09:46 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293644563.4238.7.camel@mattotaupa>	<1293645497-22323-1-git-send-email-Martin.Jansa@gmail.com>	<AANLkTimF8brtuRiXYU-kNRQQdur8FpM9=Xo4cGdJxyAG@mail.gmail.com>
	<4D1B8FA8.2040400@eukrea.com>
In-Reply-To: <4D1B8FA8.2040400@eukrea.com>
Subject: Re: [PATCH 1/2] glib-2.0, dbus: drop dbus's dependency on glib and add dbus dependency to glib-2.0_2.26.1
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
X-List-Received-Date: Wed, 29 Dec 2010 23:10:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 12/29/2010 08:44 PM, Eric B=E9nard wrote:
> PKG_CONFIG_PATH contains both native
> and non native directories.

Is this a bug or expected behavior? If expected, why is it needed at all?

Regards,
Andreas


