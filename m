Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LtdWy-00016S-1U
	for openembedded-devel@openembedded.org; Tue, 14 Apr 2009 09:58:13 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LtdTR-0007nc-65
	for openembedded-devel@openembedded.org; Tue, 14 Apr 2009 07:54:29 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 14 Apr 2009 07:54:29 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 14 Apr 2009 07:54:29 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 14 Apr 2009 09:54:18 +0200
Message-ID: <gs1ffa$2r0$1@ger.gmane.org>
References: <1239335608-11080-1-git-send-email-denis@denix.org>
	<20090410040406.GA28306@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090407 Shredder/3.0b3pre
In-Reply-To: <20090410040406.GA28306@denix.org>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] gegl: fix CR+LF newlines in the patch, as it fails to apply
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
X-List-Received-Date: Tue, 14 Apr 2009 07:58:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10-04-09 06:04, Denys Dmytriyenko wrote:
> On Thu, Apr 09, 2009 at 11:53:28PM -0400, Denys Dmytriyenko wrote:
>>
>> Signed-off-by: Denys Dmytriyenko<denis@denix.org>
>
> Ah, as I thought - CR+LF newlines were lost somewhere in the MTA/MUA
> transfer...
>
> But, if anybody cares, you can download the patch by wget and examine it in
> hexview :)
>
> $ wget 'http://cgit.openembedded.net/cgit.cgi?url=openembedded/patch/&id=51893f23d9ec8ba94d9a29be7da3914bf2259eaf' -O gegl-newlines.patch
>
> Not sure why my quilt/patch fails to apply the patch with CR+LF newlines
> though, as it appears to work fine for others.

If you can manage to get it into git properly: Acked-by: Koen Kooi 
<koen@openembedded.org>


regards,

Koen



