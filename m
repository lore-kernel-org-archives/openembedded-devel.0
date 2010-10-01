Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P1iPx-0006eR-KX
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 18:25:06 +0200
Received: by wwe15 with SMTP id 15so45331wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Oct 2010 09:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=vF7oZNSfSuutKX6ZbTjP/PdozkM+X94nFAYlLV8wuAQ=;
	b=OnLiscz8GCdQ8mdYB/SW+zbiC917u0+tzPlzg0Ww/rCqdbLfDtPLBqICrRK2H1MMSI
	D9b1gxJQPXWfeD00tjnN2qVLTxVjbdSjj5nVA1717XmH3ezTfC7F9ygJhdab3d/UFTA0
	YMAUpdWTyYgx9qSsR7Pt6xwIYE0B9F9SWpoq4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Se9fJ99ZV64hkDFY0XkAwGma6pZtHqQv+ghV0sLKlZQbUoT3kgqpA6Yi45S24RFb/f
	G+7z4lsmPBdPMHwVbYxF+1nfzyXaX9uJkQPQz6s2Qzs9eTiwLNkLnAFauRi6L1R5/zs8
	d0svbMOEiKNC/NZ5kjvCy0JCf+mAJQrpeGuzE=
Received: by 10.227.137.5 with SMTP id u5mr4735803wbt.174.1285950290410; Fri,
	01 Oct 2010 09:24:50 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.169 with HTTP; Fri, 1 Oct 2010 09:24:30 -0700 (PDT)
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA501A74993@deimsg40.de.net.world>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501A74993@deimsg40.de.net.world>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 1 Oct 2010 09:24:30 -0700
X-Google-Sender-Auth: nBGkQz9NLkunD779EYSaCclrw7k
Message-ID: <AANLkTin7zH=nJJ63En6eU+km_nN7KZqVktSeHKYFwk=7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: svn:// fetcher do not checkout repository at every build
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
X-List-Received-Date: Fri, 01 Oct 2010 16:25:06 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 1, 2010 at 8:54 AM, Hauser, Wolfgang (external) <
Wolfgang.Hauser.external@cassidian.com> wrote:

> an additional question according to checking out from svn:
>
> Before the sources are checked out from internal svn following messages
> are received:


See the PREMIRRORS variable.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

