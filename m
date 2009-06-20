Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MI8IF-0007gg-I3
	for openembedded-devel@openembedded.org; Sat, 20 Jun 2009 23:40:11 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MI87n-0003SR-QC
	for openembedded-devel@openembedded.org; Sat, 20 Jun 2009 21:29:23 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 20 Jun 2009 21:29:23 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 20 Jun 2009 21:29:23 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 20 Jun 2009 23:29:07 +0200
Message-ID: <h1jkb3$alm$1@ger.gmane.org>
References: <B7B72D38-62FD-4B6B-9856-DF4F470F832F@mac.com>	<h1jc1p$lum$1@ger.gmane.org>
	<AF709BE6-F426-426D-81FF-372ACDC18729@mac.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <AF709BE6-F426-426D-81FF-372ACDC18729@mac.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Recipe for libserial_0.6.0rc1
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
X-List-Received-Date: Sat, 20 Jun 2009 21:40:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20-06-09 21:49, Elvis Dowson wrote:
> Hi Koen,
> About the rc1 tag, that was the only version on source forge that
> compiled correctly. the existing 1.5.2 recipe doesnt even compile.

doing PV=0.6.0rc1 violates our versioning policy. I suggest you read the 
policy document in the wiki, it explains quite clearly why doing 
PV=0.6.0rc1 is wrong



