Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LuQKz-0002Gj-SU
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 14:05:50 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LuQHD-0004rG-6n
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 12:01:07 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 16 Apr 2009 12:01:07 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Apr 2009 12:01:07 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 16 Apr 2009 14:00:54 +0200
Message-ID: <gs76lo$74a$1@ger.gmane.org>
References: <1239701117-7033-1-git-send-email-k.kooi@student.utwente.nl>	<1239701117-7033-4-git-send-email-k.kooi@student.utwente.nl>	<1239701117-7033-5-git-send-email-k.kooi@student.utwente.nl>
	<200904161322.01908.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090413 Shredder/3.0b3pre
In-Reply-To: <200904161322.01908.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][STABLE][PATCH 4/4] angstrom 2009.X config file: sync with .dev
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
X-List-Received-Date: Thu, 16 Apr 2009 12:06:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16-04-09 13:22, Marcin Juszkiewicz wrote:
> Dnia wtorek, 14 kwietnia 2009 o 11:25:17 Koen Kooi napisał(a):
>> From: Koen Kooi<koen@openembedded.org>
>
> Acked-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

This patch depends on http://patchwork.openembedded.org/patch/317/ 
(+PROVIDES_append_angstrom = " bluez-libs"), so I'll hold off commit 
this one.

regards,

Koen



