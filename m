Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3A96D6F1E0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 07:36:01 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id ij19so1495547vcb.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 23:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=/a8spnBxoJWO1H04w6+nN8X0uq/+uuWkO7o8ZM5O+/w=;
	b=O5WFwaqCvj+dQ++/M89AftNngS4bnGOASnvgAnCRbDagQIvpCjOyPjBiIUXROmH3gg
	K/tomE532fzkbpNyeUpc2/JOUeV6XYRmJO8uNfCMNHGaSEwDj4Ht6YeNMvw8jbvTlxJl
	dVPsNAjgjuQVxlD0cRvoyHjhl6H9U9F+JoQY9mXoDdkxgXYG2bdeO0S/+kPQAqG31uGg
	GpU9yc/RrjoflR/w/8TDPYZEWjN43g+Nl3G6rbJFqOAzzxu+gqW+4NHhwtbmVgeQZRO4
	q+GXc3nJor7DxE+zEV0doH2N6h7e0lJmVEq9KhqlRGjz+AuNhu3jDEDzKos9mUZq3gmK
	5GFA==
MIME-Version: 1.0
X-Received: by 10.220.225.71 with SMTP id ir7mr179034vcb.50.1392881762225;
	Wed, 19 Feb 2014 23:36:02 -0800 (PST)
Received: by 10.52.35.170 with HTTP; Wed, 19 Feb 2014 23:36:02 -0800 (PST)
In-Reply-To: <CAFeBWL78jHPU1XUvo6PC4=Qy2RFKCphNbq4mH6Y_R0bbTyGMyg@mail.gmail.com>
References: <CAFeBWL6zsCSF2Op72zvnaZ=XmHQkXUcH8we=vFDrVo--wb6bdw@mail.gmail.com>
	<CALbNGRS6kRODsVKPVunWQzVSBwkKn8cXdSWwpmWTXhJ_chfeSA@mail.gmail.com>
	<CAFeBWL78jHPU1XUvo6PC4=Qy2RFKCphNbq4mH6Y_R0bbTyGMyg@mail.gmail.com>
Date: Thu, 20 Feb 2014 08:36:02 +0100
Message-ID: <CALbNGRTPPhRdLmyJAD2d3-Lmt=K-EQo-dSKwzt0a=Vcaq7rpMA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: GDM alternative?
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
X-List-Received-Date: Thu, 20 Feb 2014 07:36:02 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 19, 2014 at 5:15 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> Thank you Koen and Andreas. That has been really helped in clearing up my
> confusion and setting the path forward.
>
> I think I will try LXDM in meta-misc in meta-oe. Is there any special
> configuration that I should be aware of (other then setting it as the
> graphical init manager)?

meta-misc is my personal playground - it might have dependencies to
other layers and some things might not work as expected...

Andreas

