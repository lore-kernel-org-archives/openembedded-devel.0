Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lwyk9-0006TF-PK
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 15:13:33 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1Lwyfe-000OHn-H2
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 17:08:54 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2009 17:08:44 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <1240488138-32232-1-git-send-email-khimov@altell.ru>
	<200904231654.39712.khimov@altell.ru>
	<200904231503.30272.marcin@juszkiewicz.com.pl>
In-Reply-To: <200904231503.30272.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <200904231708.44971.khimov@altell.ru>
Subject: Re: [PATCH] bitbake.conf: use rootfs.${PN} for IMAGE_ROOTFS
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
X-List-Received-Date: Thu, 23 Apr 2009 13:13:34 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 23 April 2009 17:03:28 Marcin Juszkiewicz wrote:
> Dnia czwartek, 23 kwietnia 2009 o 14:54:39 Roman I Khimov napisa=C5=82(a):
> > ERROR: Error, lockfile path does not exist!: /path-to-oe/tmp/rootfs
>
> Note that with separated IMAGE_ROOTFS you probably do not need locking
> (unless "bitbake console-image console-image" called probably).

Good point. OK, I'll try it locally.


