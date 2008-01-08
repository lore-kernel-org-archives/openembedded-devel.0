Received: from [72.14.220.153] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philipp.zabel@gmail.com>) id 1JCJSd-0000Cf-GO
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2008 19:46:03 +0100
Received: by fg-out-1718.google.com with SMTP id l27so5001004fgb.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2008 10:39:03 -0800 (PST)
Received: by 10.82.152.16 with SMTP id z16mr2352554bud.17.1199813917518;
	Tue, 08 Jan 2008 09:38:37 -0800 (PST)
Received: by 10.82.120.17 with HTTP; Tue, 8 Jan 2008 09:38:37 -0800 (PST)
Message-ID: <74d0deb30801080938u7a6d8c68re2315c1b4825ab83@mail.gmail.com>
Date: Tue, 8 Jan 2008 18:38:37 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200801081808.13174.zecke@selfish.org>
MIME-Version: 1.0
References: <47836C9B.3000407@gmx.net> <200801081527.09859.zecke@selfish.org>
	<1199804390.30486.28.camel@hammer.suse.cz>
	<200801081808.13174.zecke@selfish.org>
Subject: Re: RFC: add osso version of libtool and libatk
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
X-List-Received-Date: Tue, 08 Jan 2008 18:46:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Jan 8, 2008 6:08 PM, Holger Freyther <zecke@selfish.org> wrote:
> On Tuesday 08 January 2008 15:59:50 Stanislav Brabec wrote:
> > Can you tell me what is the purpose of this patch? I looked into 15000
> > lines of the atk patch and cannot find any single change except adding
> > debian directory (not needed for OE) and modifying or adding of
> > auto-generated files (documentation, config.* and marshalls).
> >
> > I am not able to find any single change in the code.
>
> I briefly talked with Robert on IRC. The requirement is not to use the osso
> variant but the upstream version. For libtool this is 1.5.6 and for atk
> probably the same applies.
>
> My conclusion is there is nothing wrong with (re)adding the versions with a
> DEFAULT_PREFERENCE="-1" and I asked him to proceed.

If the those are the unpatched upstream versions, and they are older than the
latest versions in OE, is the DEFAULT_PREFERENCE even needed?

regards
Philipp


