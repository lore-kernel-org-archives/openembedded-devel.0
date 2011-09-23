Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1R6tJk-0002lo-2f
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Sep 2011 02:08:36 +0200
Received: by qyk10 with SMTP id 10so18382995qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2011 17:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Vknc+sNjds5NWZkVcjiWNoD+An4zpl2Z4tXqd0kKlfk=;
	b=YOVG+AJlrix8Oolucksxr5q8xb23ULArrovGzOSs3KtF2N7D8yrC2snW44+0haWBXs
	Kh2tqgHFC4SGlDaXfzfzInM1lBu/Lz8mxDYZ4S1/FHOzMajXs5BxotEtfEgTFPc4x3Rv
	36y1UZqK74KxW4EhadkymJRGWaMn//e19yyXo=
MIME-Version: 1.0
Received: by 10.224.70.138 with SMTP id d10mr2342488qaj.319.1316736195638;
	Thu, 22 Sep 2011 17:03:15 -0700 (PDT)
Received: by 10.229.43.228 with HTTP; Thu, 22 Sep 2011 17:03:15 -0700 (PDT)
In-Reply-To: <20110921224702.GM26078@denix.org>
References: <20110921224702.GM26078@denix.org>
Date: Thu, 22 Sep 2011 17:03:15 -0700
Message-ID: <CA+M6bXnUKee7JondGzuncwstktxW9gyMba=HZW-27P8HMMuPhw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Pull request 20110921
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
X-List-Received-Date: Fri, 23 Sep 2011 00:08:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2011 at 3:47 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> Tom,
>
> Please pull these 5 commits to gcc (4.5) that update the maintenance bran=
ch
> to match the mainline. Part of this update is to fix the ICE building new=
er
> kernels (2.6.39 - 3.0.x). All are cherry-picked from oe.dev.
>
>
> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
> =A0Branch: 2011.03-maintenance
> =A0Browse: http://arago-project.org/git/people/?p=3Ddenix/openembedded.gi=
t;a=3Dshortlog;h=3Drefs/heads/2011.03-maintenance
>
> Thanks,
> =A0 =A0Denys Dmytriyenko <denys@ti.com>

Applied, thanks.

--=20
Tom


