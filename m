Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1QWFMn-0002So-LB
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 00:12:17 +0200
Received: by qwh5 with SMTP id 5so2655752qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2011 15:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=y2PSlZz3ythHSUqMKKzh3kTKxs9yj5Kjdtv3aAKATck=;
	b=Vdg5Kp78ywwx5AeolORIlRNq1yNhGeZflxtMfVkt9ulaH1eY7yLEBQRLGfKmDIzvHl
	n8WWeNmfDVVR/EsGKeS8uOwxLNI2AqJ6iv4mn/x9uAjgzs/TVQqqI0MbYVNR5UDknhV7
	gOpXpVX30GcUj950PrIR1H+OJTBwJ6QtOd4H8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=lG4BHdDHlzP5Zs9mBirzQjLzQ1G+yaIo291iToRmYcYYqkYZoi09FVA2SBC/O02Kwo
	qC7V5Sb5p/5uAc1r4gexQKE/vCJxT34zVIzGA9+trHsHqdEGra24ntMJXB1fZpneAF4r
	AWH1wWzqHus589BVNIQrTMCy+863hS/2RhtBM=
MIME-Version: 1.0
Received: by 10.229.20.83 with SMTP id e19mr4364011qcb.288.1308002932389; Mon,
	13 Jun 2011 15:08:52 -0700 (PDT)
Received: by 10.229.73.206 with HTTP; Mon, 13 Jun 2011 15:08:52 -0700 (PDT)
In-Reply-To: <1308001690.4081.9.camel@mattotaupa>
References: <1307987531-2625-1-git-send-email-pespin.shar@gmail.com>
	<1307988638.4081.5.camel@mattotaupa>
	<BANLkTi=4kSE18LPqTyEgYRmZViJ4f+gGgw@mail.gmail.com>
	<BANLkTinVfs_kznrr9C9G2jtS516ud99Ltw@mail.gmail.com>
	<BANLkTinr27EvybkKQuG+i0ZWs6QthjxgcA@mail.gmail.com>
	<1307996077.4081.6.camel@mattotaupa>
	<BANLkTikxGpZbYYq55VtCKSdA_3T-VRO3fA@mail.gmail.com>
	<1308001690.4081.9.camel@mattotaupa>
Date: Tue, 14 Jun 2011 00:08:52 +0200
Message-ID: <BANLkTimfr7RzTxkVzStFuwk-duMADhD3Pg@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] enjoy: add alsa and autodetect gst modules. Without autodetect, enjoy segfaults. Without alsa, no sound is played
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
X-List-Received-Date: Mon, 13 Jun 2011 22:12:17 -0000
Content-Type: text/plain; charset=UTF-8

2011/6/13 Paul Menzel <paulepanter@users.sourceforge.net>

> Am Montag, den 13.06.2011, 23:16 +0200 schrieb Pau Espin Pedrol:
> > 2011/6/13 Paul Menzel <paulepanter@users.sourceforge.net>
> >
> > > But maybe it should fail gracefully and not segfault.
> >
> > For sure, but imo this has nothing to do with this patch. I'm just adding
> needed deps for the app to do its work as expected :)
>
> Of course.
>
> To improve Enjoy it would be perfect to report that problem to the
> upstream developers. This would be the perfect solution for this
> problem.
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
I might find time to write and send a patch for that to emotion guys :)

-- 
Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

