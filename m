Return-Path: <daniel.markus@leica-geosystems.com>
X-Greylist: delayed 24108 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 13 Nov 2015 14:58:57 UTC
Received: from eu-smtp-delivery-94.mimecast.com
	(eu-smtp-delivery-94.mimecast.com [207.82.80.94])
	by mail.openembedded.org (Postfix) with ESMTP id 42D1177317
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 14:58:56 +0000 (UTC)
Received: from AHERSRVDOM03.lgs-net.com (193.8.40.98 [193.8.40.98]) by
	eu-smtp-1.mimecast.com with ESMTP id uk-mta-8-e5adTMwJRd22W9csEJKhtg-1; 
	Fri, 13 Nov 2015 14:58:55 +0000
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbi-sV524kh3zNfdYPbS+5g9e14Xp-6X6jSePZbP_XBVg@mail.gmail.com>
References: <CAJTo0Lbi-sV524kh3zNfdYPbS+5g9e14Xp-6X6jSePZbP_XBVg@mail.gmail.com>,
	<OF7A12C232.50FCBFAB-ONC1257EFC.002CEC65-C1257EFC.002CEC6A@leica-geosystems.com>
From: daniel.markus@leica-geosystems.com
To: openembedded-devel@lists.openembedded.org
X-Mailer: Lotus Domino Web Server Release 9.0.1FP3 January  12, 2015
X-MIMETrack: Serialize by HTTP Server on HXSESRVDOM01/EMEA/Leica(Release
	9.0.1FP3|January 12, 2015) at 11/13/2015 03:58:54 PM,
	Serialize complete at 11/13/2015 03:58:54 PM,
	Serialize by Router on AHERSRVDOM03/EMEA/Leica(Release 9.0.1FP3|January
	12, 2015) at 13.11.2015 15:58:55
Message-ID: <OFDC93B59D.CA7E0E70-ONC1257EFC.00524C28-C1257EFC.00524C2A@leica-geosystems.com>
X-Priority: 3 (Normal)
Importance: Normal
Date: Fri, 13 Nov 2015 15:58:54 +0100
X-MC-Unique: e5adTMwJRd22W9csEJKhtg-1
Subject: Re: Is there a recipe for gdbserver?
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
X-List-Received-Date: Fri, 13 Nov 2015 14:58:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Perfect, thanks Ross!

Br,
Daniel


-----openembedded-devel-bounces@lists.openembedded.org wrote: -----To: Open=
Embedded Devel List <openembedded-devel@lists.openembedded.org>
From: "Burton, Ross"=20
Sent by: openembedded-devel-bounces@lists.openembedded.org
Date: 11/13/2015 10:11AM
Subject: Re: [oe] Is there a recipe for gdbserver?

On 13 November 2015 at 08:10, <daniel.markus@leica-geosystems.com> wrote:

> Is there a recipe for gdbserver only, so I can get that small application
> cross-compiled and installed on target?
>

It's part of gdb, and packaged separately so you can just install gdbserver
on the target.

Ross
--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


