Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 49915612D1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2013 20:05:22 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id i7so2862453oag.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2013 12:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=aWqb7cwoBbi+LGD16IaAGUtD52emuhSZ4UWVy1ZKYUs=;
	b=ajUJyc+kNe307dFwDJeBRQ0gT3pM0eEibd7Kk/PIrNAIqP1c0e1H0A4lqBicsa9hC3
	nwS64HTt8cbx/5tkIeew5y2i6OZ+5rtetcjcyGKhd275ZLp3GLUUV3eVOhGvQGZw07po
	4pU/SJoNuIRiidogja+Cg5tYSkISHetRb29xazoMUsMfhFHmZyL7wF69rzi7cgbSvPW0
	dT76FHISa0ZgIJGQfBI8E4yBjxRnG58e8QGp0+sOUCJWkIkdT97zi/dTfQco6T/cRUA/
	8FI1UOf9jddGR70bybcxJnnRHSx9Jpd6+f8S1LsBV6rwTpt8SRygKDwrQJ0JQFFzyYUh
	exUA==
MIME-Version: 1.0
X-Received: by 10.60.134.42 with SMTP id ph10mr3373856oeb.76.1384459523533;
	Thu, 14 Nov 2013 12:05:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 14 Nov 2013 12:05:23 -0800 (PST)
In-Reply-To: <CAFeBWL7fDEJtkHosrJJUx76ssMiau+bb3EtATWoybNWyb=1FGA@mail.gmail.com>
References: <CAFeBWL4xeq+4cL9gvnCDSU1Va8edf+1zT+G7BfYto7Yvp8HXXQ@mail.gmail.com>
	<CAFeBWL4R46JrAhCfe8GZXTipHAp_i+Fcu_BTTTuopfdfKf9r5g@mail.gmail.com>
	<11078227.Ap2jLt1X9L@helios>
	<CALbNGRSiUdEzPLoP5Le58QDV1cqKcLRRyWxxTGyG4dKu7tqB3Q@mail.gmail.com>
	<CAFeBWL4YZ-izwN-3oaqfoaPSi=h=WQ+M0=BU_eGOXtx=q6AfPw@mail.gmail.com>
	<CAP9ODKpMTNOWRkHTv2gWEattq1Bhj-jvbBk80NLt23eV5UzUuw@mail.gmail.com>
	<CAFeBWL7fDEJtkHosrJJUx76ssMiau+bb3EtATWoybNWyb=1FGA@mail.gmail.com>
Date: Thu, 14 Nov 2013 18:05:23 -0200
X-Google-Sender-Auth: 7qxg13QAdK6srdZnfocmsUGqzEQ
Message-ID: <CAP9ODKpg5VCe2jhzK3u-_4BQCxz26_7wfMCLs0JF6T2OuBz4Tg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: libmpd-11.8.17 gets 404 Not Found
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
X-List-Received-Date: Thu, 14 Nov 2013 20:05:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 14, 2013 at 5:41 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> Thanks Otavio. Quick question - is there a reason not to use the upstream?
> - http://www.musicpd.org/download/mpd/stable/

I see no reason, cook a patch for it :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

