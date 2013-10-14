Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by mail.openembedded.org (Postfix) with ESMTP id 510C36D11A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 16:43:00 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUO00J2U3RPQCB0@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	14 Oct 2013 11:43:01 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 03EFE200A9; Mon,
	14 Oct 2013 12:42:58 -0400 (EDT)
Date: Mon, 14 Oct 2013 12:42:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20131014164258.GG27046@denix.org>
References: <5256F33C.50609@balister.org> <l36sqj$dd6$1@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <l36sqj$dd6$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [RFC] Create meta-sdr in meta-oe
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
X-List-Received-Date: Mon, 14 Oct 2013 16:43:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 10, 2013 at 08:49:03PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Op 10-10-13 20:34, Philip Balister schreef:
> > At the GNU Radio conference last week, several people working with 
> > gnuradio on embedded systems asked about creating a meta-sdr to hold 
> > gnuradio and uhd. This would be the starting point for adding some other 
> > gnuradio out of tree applications. This could also be a home for some 
> > other sdr frameworks such as Iris and ALOE.
> > 
> > Software that is more focused toward the amateur radio community should 
> > not end up here since there is little overlap in the developer 
> > communities at this time.
> > 
> > Any comments?
> 
> soft66 and rtl-sdr can live there as well. I have recipes for that :)

I like both proposals. The only question is which is better placements - an 
own repo and a layer, or just another sub-layer in meta-openembedded repo?

-- 
Denys

