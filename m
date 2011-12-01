Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RWFMc-0001Z1-76
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 23:44:22 +0100
Received: by iahk25 with SMTP id k25so3139983iah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 14:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=XWLNDasQCfZ0B6gcACwInrRo1ZpoTutsx0EDPbh71I8=;
	b=Ip9j60/W+59oEqRfPdnJFUfu4tyDVyiGyayvTxHJmGVGnF0PP0DAYByrNIxW7uiDmX
	fK4SOLz6rkYl97HXDNJTMMGoplHammPvr7380IPd8N3/8R69O4TFi/mmQHo9v66l+8Yz
	rVCGwA9cr6x+rrs1iKH+jf8QMdLwZZkkx+P2Q=
Received: by 10.231.63.129 with SMTP id b1mr2423197ibi.75.1322779056326;
	Thu, 01 Dec 2011 14:37:36 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id z10sm26281030ibv.9.2011.12.01.14.37.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 14:37:34 -0800 (PST)
Date: Thu, 1 Dec 2011 14:45:48 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111201224548.GC9685@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <mailman.501.1322730000.26642.openembedded-devel@lists.openembedded.org>
	<CAPdp9mwrRs2+m=ixuJCC=ASQ0jrz4Wy1MGFxFX6q=CzF9Z8LdQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPdp9mwrRs2+m=ixuJCC=ASQ0jrz4Wy1MGFxFX6q=CzF9Z8LdQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Openembedded-devel Digest, Vol 65, Issue 2
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
X-List-Received-Date: Thu, 01 Dec 2011 22:44:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (01/12/11 16:26), Rizwan Shaik wrote:
> Dear Sir/Madam,
> 
> I am getting the following error while building the OpenEmbedded Angstrom
> image.
> 
> ERROR: Task 31
> (/media/THARMA_OE_500GB/rizwan_oe_11.04/openembedded/recipes/shasum/
> shasum-native.bb, do_fetch) failed
> NOTE: Tasks Summary: Attempted 1 tasks of which 1 didn't need to be rerun
> and 1 failed.
> ERROR: '/media/THARMA_OE_500GB/rizwan_oe_11.04/openembedded/recipes/shasum/
> shasum-native.bb' failed
> 
> Please give me a solution.Thank you in Advance.
> Waiting for the solution.

Provide more log information, it should tell you locations it tried to
fetch the source from and sometimes these temporary problems too. Try to
rerun your build

-Khem


