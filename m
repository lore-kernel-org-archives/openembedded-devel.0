Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vb0-f46.google.com (mail-vb0-f46.google.com
	[209.85.212.46])
	by mail.openembedded.org (Postfix) with ESMTP id 671FB6D582
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 21:28:03 +0000 (UTC)
Received: by mail-vb0-f46.google.com with SMTP id i3so1170099vbh.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 13:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=/dJoTpnjIGdMULICKDU2uLzq5D9ZaEnK7z7o+g15A2E=;
	b=ndUBAmAhMa581DLPVeHNR4caz4fC6OQPiKTyC8rfZ+NJXPPLSBwG+ERnzZQyBjskxf
	CoCfYhXmC3N4ZGyx92lokQpsL1SNGd8k7L9fsE7zi2XEuil90wK4BXab78gYyKTPHcyY
	72otsizzKbC4ClD2JDjG/jgisWC31lbm3//KUqeVmtttrsZjo7jR/AcN0Qy4elwfv+uI
	e7LiswS/BsjPbMfXsFjHaDi6S2olTuGCGwC/RL+hPUPNjtaa50pHJxW7XK+IXOvacBKh
	Vr5tNZp9ZUB9QDEyahBvbBPrsBtDPC6GaKozQZhuWJlQpjXSWJ0W2e0qPgsnBiDW8Y9Q
	S4Fg==
MIME-Version: 1.0
X-Received: by 10.52.233.2 with SMTP id ts2mr701939vdc.44.1384550884570; Fri,
	15 Nov 2013 13:28:04 -0800 (PST)
Received: by 10.52.185.9 with HTTP; Fri, 15 Nov 2013 13:28:04 -0800 (PST)
In-Reply-To: <CALbNGRQcVwRpqKvWpgnNBpN-4bn+kJSj6m8j=eV0zme0md8j9w@mail.gmail.com>
References: <CAFeBWL4xeq+4cL9gvnCDSU1Va8edf+1zT+G7BfYto7Yvp8HXXQ@mail.gmail.com>
	<CAFeBWL4R46JrAhCfe8GZXTipHAp_i+Fcu_BTTTuopfdfKf9r5g@mail.gmail.com>
	<11078227.Ap2jLt1X9L@helios>
	<CALbNGRSiUdEzPLoP5Le58QDV1cqKcLRRyWxxTGyG4dKu7tqB3Q@mail.gmail.com>
	<CAFeBWL4YZ-izwN-3oaqfoaPSi=h=WQ+M0=BU_eGOXtx=q6AfPw@mail.gmail.com>
	<CAP9ODKpMTNOWRkHTv2gWEattq1Bhj-jvbBk80NLt23eV5UzUuw@mail.gmail.com>
	<CAFeBWL7fDEJtkHosrJJUx76ssMiau+bb3EtATWoybNWyb=1FGA@mail.gmail.com>
	<CALbNGRQcVwRpqKvWpgnNBpN-4bn+kJSj6m8j=eV0zme0md8j9w@mail.gmail.com>
Date: Fri, 15 Nov 2013 13:28:04 -0800
Message-ID: <CAFeBWL5uKWtT2QBdqXucnG2Wpj+ye72xStus396_Q8Swp1_sAQ@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Fri, 15 Nov 2013 21:28:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

There is a pull request on this -
https://github.com/openembedded/meta-oe/pull/15


On Thu, Nov 14, 2013 at 1:48 PM, Andreas M=FCller <
schnitzeltony@googlemail.com> wrote:

> On Thu, Nov 14, 2013 at 8:41 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> > Thanks Otavio. Quick question - is there a reason not to use the
> upstream?
> > - http://www.musicpd.org/download/mpd/stable/
> >
> > Thanks,
> >
> > Adam
> >
> patches welcome - but please check for xfce4-mpc-plugin and xfmpc are
> still building with mpc.
>
> Andreas
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

