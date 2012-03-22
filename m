Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SAqOh-0000gz-9Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 23:22:19 +0100
Received: by obqv19 with SMTP id v19so1961530obq.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 15:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=gD6DD/MJFb7X9M1CkfDxyRTFSMZWiRlohIzjcZ5T8MY=;
	b=jaCJ+UQKPWeJ9RzKHLXw+ON70Yc7vvF1FHIycvTa45w+NrMuNRjuXdLIESai/Vc5eF
	hWWxvtcSyniYIOyq5fCmNt41JxkBWFv8kY7X8JL00Igoh3xYQacpGrsCRRd4Gry09BN+
	N3Ot1Y92V8OqmTtjNEPh5gfBMEWn7l8P2IFyr8TM4CifVh+QUm4el4+dZPq0uZl87Hkj
	JJbhlyjRsNcMvLz8Y71lS17dShrQJIt92omiTDKoFROIr8LE4/UNPLlstcFEnDjd9+Sl
	tdgsxmL/ZREhmjEA8l4ZhXyBeHiaZGFkW63BkKCvcCtwR/UY6mlbei2MIddZbak9Nyqr
	9w1Q==
Received: by 10.182.179.68 with SMTP id de4mr12330950obc.13.1332454403518;
	Thu, 22 Mar 2012 15:13:23 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id d6sm4711772oeh.3.2012.03.22.15.13.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 15:13:22 -0700 (PDT)
Date: Thu, 22 Mar 2012 15:13:23 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20120322221323.GE28378@bill-the-cat>
References: <4F69AF4A.8050809@dresearch-fe.de>
	<1332326252-7381-1-git-send-email-sledz@dresearch-fe.de>
	<CA+M6bXnXmFf0syVz-71Y_Ovkq1pvsw8DBjZcfx1=dvZ4pD48wg@mail.gmail.com>
	<CA+M6bXmJ9YWR74eEWj-0pNYVziCNb+8Ac-DKPNG1inPaELKAiA@mail.gmail.com>
	<4F6ACE55.2070002@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <4F6ACE55.2070002@dresearch-fe.de>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libmatthew-0.7.1: SRC_URI updated
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
X-List-Received-Date: Thu, 22 Mar 2012 22:22:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 22, 2012 at 08:01:41AM +0100, Steffen Sledz wrote:
> On 21.03.2012 15:46, Tom Rini wrote:
> > On Wed, Mar 21, 2012 at 7:44 AM, Tom Rini <tom.rini@gmail.com> wrote:
> >> On Wed, Mar 21, 2012 at 3:37 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> >>> libmatthew-java-0.7.1.tar.gz is no longer available at the original
> >>> location.
> >>>
> >>> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> >>
> >> NAK, please switch it to the snapshot.debian.org URL I provided so we
> >> don't have to change this recipe at some point in the future again.
> > 
> > On third thought, lemme think about this.  I don't like pointing
> > somewhere that might remove it, again, but I also don't like changing
> > checksums for folks that already have it down.  So, unless someone
> > else disagrees, we'll favor same checksums over retention and if
> > fedoraproject removes it, we'll just point at the copy on the OE
> > server.
> 
> So finally that's an ACK for my patch?

Yes, thanks.

-- 
Tom


