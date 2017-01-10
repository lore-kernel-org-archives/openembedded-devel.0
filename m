Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id EB05B719F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 16:16:41 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id m78so97489214lfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 08:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=pUNrnwgMQ1KzWFiH1oYj8w1a1hmNrl5T8B0Lgn+iXFM=;
	b=gKL4SsTi8qz71UKk1LWq6idhn4UwCnCYrSynzHz1oxPESKKruolDRXBVr7SnaGoETT
	4852XOkPhebOLrqiNUnaDCMT+TabTDm/fXH3ofqRDOw71KM79+IcmAwzMwT/w+5oveeC
	MPPVGc8kFiNfEQJPLcnSmPOQdFlCm6R1Gh2HtLm0TSPm5D65KOtd0vQSvunT1KHNPrOU
	58/sYyJGa0+4IlmV9OT6Vjv/1tmYOW9ONQ0BAQF90Wb18LtZ6eHv6FbnfnAv41MVyhO9
	8b7fyXs5BikOHnWyer2J//hEqLYSdiDNviZm95Kn5/4/Zu98J82609RvcZyB6whsBPTr
	x1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=pUNrnwgMQ1KzWFiH1oYj8w1a1hmNrl5T8B0Lgn+iXFM=;
	b=DUxjtx5JYcJHgpWgG5pNjbUO5CCB5K5Evcz9wqkpxnPngmbdKo0xOnQxjkxoV3n041
	1M8UQkBj8VoIiy40L8BzatbGMNIlEmCRIhE5SkmXZvLfLgJBUfclAOezsrtx8NmKZg7s
	iP9ARs7IycTqarJ72tpZVif10eqgKtu5u32z8zwxKQf8YDFrQ73bUCbYVBkVP3DC68Wj
	EvMPKKLJ9hboCyaDMCDDoQESp+pu1FGHIK5Be8oq++T2dR3cCh5QSzeUJM51AjZJBeUV
	rN9eWT4SnQwr22g2CujspdwnFmtQG8nzp0qAd+en8nqFARSuyzHxt8Fh4NgO50DKtzIN
	m6Fw==
X-Gm-Message-State: AIkVDXJ4FFuCzj+1Q5hG7SRDErXCNhlRQBnrYNfkTAzKPett/4vzGTKQeDMCT+tNMFv5gpaGLkpG+pRJOtbmjw==
X-Received: by 10.25.195.151 with SMTP id t145mr1537291lff.149.1484065001420; 
	Tue, 10 Jan 2017 08:16:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.41.70 with HTTP; Tue, 10 Jan 2017 08:16:10 -0800 (PST)
X-Originating-IP: [189.114.111.135]
In-Reply-To: <CALbNGRSLsKm2hbeMLCt7eng9MfgaovQmpHoT8w-S3VxOO6__WA@mail.gmail.com>
References: <1481824331-347-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRSLsKm2hbeMLCt7eng9MfgaovQmpHoT8w-S3VxOO6__WA@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Tue, 10 Jan 2017 14:16:10 -0200
Message-ID: <CAAPZna30_rbUmZdEuR19oB9wa3pJ+iN7Pf82iLu8Yj1rU5LmaA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser][PATCH V2 0/3] firefox fix build on oe-core master
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jan 2017 16:16:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas!

Firefox was updated to version 45.6.0, please update your patches and send
a v3.

Thanks.

On Tue, Jan 10, 2017 at 8:57 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Thu, Dec 15, 2016 at 6:52 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > * recent 'use system's nss/nspr' broke firefox
> > * to build properly patch sent to oe-core is necessary [1]
> >
> > V1 -> V2: 0003-.. added to really fix build
> >
> > [1] http://lists.openembedded.org/pipermail/openembedded-core/
> 2016-December/130211.html
> >
> > Andreas M=C3=BCller (3):
> >   firefox: fix configure with oe-core master - there is no nss-config
> >   firefox: use pkg-config to find nspr
> >   firefox: do not link against crmf library it is not there
> >
> >  .../firefox/0001-use-pkg-config-to-find-nss.patch  | 47
> ++++++++++++++++++++++
> >  .../firefox/0002-use-pkg-config-to-find-nspr.patch | 37
> +++++++++++++++++
> >  ...link-against-crmf-library-it-is-not-there.patch | 47
> ++++++++++++++++++++++
> >  recipes-mozilla/firefox/firefox_45.5.1esr.bb       |  3 ++
> >  4 files changed, 134 insertions(+)
> >  create mode 100644 recipes-mozilla/firefox/firefox/0001-use-pkg-config=
-
> to-find-nss.patch
> >  create mode 100644 recipes-mozilla/firefox/firefox/0002-use-pkg-config=
-
> to-find-nspr.patch
> >  create mode 100644 recipes-mozilla/firefox/firefox/0003-do-not-link-
> against-crmf-library-it-is-not-there.patch
> >
> > --
> > 2.7.4
> >
> ping?
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

