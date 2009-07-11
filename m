Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MPgXt-00026L-4g
	for openembedded-devel@openembedded.org; Sat, 11 Jul 2009 19:39:33 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MPgLJ-0005Rs-3R
	for openembedded-devel@openembedded.org; Sat, 11 Jul 2009 17:26:33 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 11 Jul 2009 17:26:33 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 11 Jul 2009 17:26:33 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 11 Jul 2009 19:26:18 +0200
Message-ID: <h3ahvq$kv2$1@ger.gmane.org>
References: <1247272621-26730-1-git-send-email-msmith@cbnco.com>	<1247272621-26730-3-git-send-email-msmith@cbnco.com>	<h39dju$tfg$1@ger.gmane.org>
	<200907110929.56270.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090708 Shredder/3.0b3pre
In-Reply-To: <200907110929.56270.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 3/4] hicolor-icon-theme: don't inherit gnome
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
X-List-Received-Date: Sat, 11 Jul 2009 17:39:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11-07-09 09:29, Marcin Juszkiewicz wrote:
> Dnia sobota, 11 lipca 2009 o 09:05:34 Koen Kooi napisał(a):
>> On 11-07-09 02:37, Michael Smith wrote:
>>> inherit autotools instead, so the theme doesn't end up depending
>>> on gconf and gnome-common.
>>
>> NAK, it's dragging gnome for gtk-icon-cache.bbclass to update the
>> theme cache files, your change would break that.
>
> So maybe it should inherit autotools and gtk-icon-cache?

exactly



