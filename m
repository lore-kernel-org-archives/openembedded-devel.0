Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1IQeYZ-0004dN-Oa
	for openembedded-devel@openembedded.org; Thu, 30 Aug 2007 09:35:11 +0200
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B02A6C8D5 for openembedded-devel@openembedded.org;
	Thu, 30 Aug 2007 09:32:11 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Thu, 30 Aug 2007 10:33:20 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHKEOGMBAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
Importance: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3138
In-Reply-To: <e9c3a7c20708291836v6cee3f34kba062518468c360f@mail.gmail.com>
Subject: Re: [rfc] [patch] samba 3.0.25c support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2007 07:35:12 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Dan,

Could you post it to the bug tracker also, so devs can pick it up from there

Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of
> Dan Williams
> Sent: Thursday, August 30, 2007 4:37 AM
> To: openembedded-devel@openembedded.org
> Subject: [oe] [rfc] [patch] samba 3.0.25c support
>
>
> Please find attached two patches to get samba-3.0.25c building and
> running.  The big build hurdle was autotools.bbclass not including all
> of samba's *.m4 files.
>
> Please check that I was not overzealous in the cross-compilation
> options that I forced to 'enabled' in configure.in.  At least one,
> HAVE_GETGROUPLIST, prevents runtime errors.
>
> These patches are based on revision
> f2109f0b5423893b09743e0a086dd3e86b7e57cb.  Tested with:
> MACHINE = i686-generic
> DISTRO = angstrom-2007.1
>
> Regards,
> Dan
>




