Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S5xH7-00050c-Q6
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 11:42:18 +0100
Received: by iaag37 with SMTP id g37so1911357iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 02:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=DLYQYYP85NLCIvUy9KIc+eUXLmeXPhrqRZCfT5quG3Y=;
	b=knU0cxJC+nSoPOJO5k4jQX92Dp9SW9jtCLfgFLAn8T9I16aoxUc3b0x3+3u2PSvTgF
	o7NdLyZrPgTymxv2cC6D8/rHhhNGnMyagGPRrNmbJCBHAvGmNbySsGSu/ECitb7HQHp2
	GJt7255TLH6jgPs/hKAWryuPnrF1vvCoso1FcCtbtrpbyP8PXDRRTlNJ8lHJeLpK2YAE
	DnYZI2+hUPLlpwRo5lptp+xRowZsAsk+ezuQsKVsDCmzohKH+edJM6EA+vx9op+C7gY3
	Ft+CFaoiA03ZpsHJoJrF4+uV8I0qzbW6Oe2BfCwL4Vzt6ZJlXWyEMm93uCir2OdbCcsa
	jemw==
MIME-Version: 1.0
Received: by 10.50.154.169 with SMTP id vp9mr2044840igb.61.1331289218151; Fri,
	09 Mar 2012 02:33:38 -0800 (PST)
Received: by 10.42.75.137 with HTTP; Fri, 9 Mar 2012 02:33:38 -0800 (PST)
In-Reply-To: <1331289031.14363.611.camel@phil-desktop>
References: <CALbNGRS6OTEqfUyGw=EwDdtfyXWLF+Xb+rRJ_HBK+RnPBSD-XA@mail.gmail.com>
	<1331289031.14363.611.camel@phil-desktop>
Date: Fri, 9 Mar 2012 11:33:38 +0100
Message-ID: <CALbNGRTOWNiopJSQfVNpi+Jrsst7xRnP+3asmTAAar7tVdBETg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: meta-oe github sync?
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
X-List-Received-Date: Fri, 09 Mar 2012 10:42:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 9, 2012 at 11:30 AM, Phil Blundell <philb@gnu.org> wrote:
> On Fri, 2012-03-09 at 10:49 +0100, Andreas M=FCller wrote:
>> I just updated meta-oe from but today's patches are missing. What is
>> the expected synchronization frequency?
>
> The ssh key that we use to push to github had been disabled owing to a
> security compromise (at github). =A0I've re-enabled it now and I think th=
e
> sync should start working again within about the next hour.
> (Unfortunately my login access to garnet seems to have been revoked so I
> can't actually check what's going on at that end.)
>
> p.
Recent patches arrived. Thanks

Andreas


