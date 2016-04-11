Return-Path: <denis@denix.org>
X-Greylist: delayed 3622 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Apr 2016 19:11:30 UTC
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by mail.openembedded.org (Postfix) with ESMTP id 032336FFC8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 19:11:30 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.152])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5H00CGZEIKAM50@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	11 Apr 2016 13:11:08 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=Q4-j1AaZAAAA:8
	a=NGrVYnIGI5pdS84U7hEA:9 a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 585b2b27; Mon, 11 Apr 2016 18:11:08 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 15199161F91; Mon,
	11 Apr 2016 14:11:08 -0400 (EDT)
Date: Mon, 11 Apr 2016 14:11:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-id: <20160411181108.GR16135@denix.org>
References: <e3io1npq0c1rbqicen5r2dcf.1460055017573@email.android.com>
MIME-version: 1.0
In-reply-to: <e3io1npq0c1rbqicen5r2dcf.1460055017573@email.android.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: James Minor <james.minor@ni.com>, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ti-wifi-utils: add recipe
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
X-List-Received-Date: Mon, 11 Apr 2016 19:11:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Resending again, since my previous reply got truncated when sending to the 
list:

On Thu, Apr 07, 2016 at 11:50:10AM -0700, Denys Dmytriyenko wrote:
> > http://layers.openembedded.org/layerindex/branch/master/recipes/?q=ti-wifi-utils
> >
> > Yes, it is a duplicate. How about keeping the recipe in meta-oe to make
> > it usable without adding arago distributions layers?
> 
> Well, it is currently NOT in the distribution layer, but rather in the
> application layer... But I guess I'm fine submitting the latest version to
> meta-oe, once I'm back from ELC.

