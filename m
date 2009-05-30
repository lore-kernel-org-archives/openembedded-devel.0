Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MAFP0-0002W3-KD
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 05:38:34 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MAFGk-0003VC-Io
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 03:30:02 +0000
Received: from CPE00045a927e3e-CM001225463986.cpe.net.cable.rogers.com
	([99.245.234.255]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 03:30:02 +0000
Received: from msmith by
	CPE00045a927e3e-CM001225463986.cpe.net.cable.rogers.com with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 03:30:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Michael Smith <msmith@cbnco.com>
Date: Sat, 30 May 2009 00:48:44 +0000 (UTC)
Message-ID: <loom.20090530T004559-114@post.gmane.org>
References: <Pine.LNX.4.64.0905260228240.6446@juice.ott.cti.com>
	<1243319696-16223-1-git-send-email-msmith@cbnco.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 99.245.234.255 (Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_7;
	en-us) AppleWebKit/525.28.3 (KHTML, like Gecko) Version/3.2.3
	Safari/525.28.3)
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 1/4] Remove references to base_set_filespath()from	recipes that don't need it.
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
X-List-Received-Date: Sat, 30 May 2009 03:38:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Michael Smith <msmith <at> cbnco.com> writes:

> 
> These recipes are covered by the default FILESPATHPKG setting.
> 
> Signed-off-by: Michael Smith <msmith <at> cbnco.com>
> ---

ping

(patchbundle here: 
http://patchwork.openembedded.org/bundle/msmith%40cbnco.com/nuke_base_set_filespath_usage/ )

Mike



