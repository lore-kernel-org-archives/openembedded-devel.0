Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MATgU-0008Kv-Fg
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 20:53:34 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MATYE-0004qm-6I
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 18:45:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 18:45:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 18:45:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 30 May 2009 20:40:42 +0200
Message-ID: <gvruj9$aj3$2@ger.gmane.org>
References: <065E68EB87448440A3E75B4DBB5E871C45A407@CORPUSMX100C.corp.emc.com>
	<gvrtqn$8oh$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090526 Shredder/3.0b3pre
In-Reply-To: <gvrtqn$8oh$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [patch] remove dirty .swp file in mini-httpd recipe
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
X-List-Received-Date: Sat, 30 May 2009 18:53:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30-05-09 20:27, Rolf Leggewie wrote:
> Lin_Lynn@emc.com wrote:
>> In mini-httpd recipe,there is a .mini-httpd_1.19.bb.swp dirty file,the
>> patch in the attach is to remove this dirty file.
>
> Acked-by: Rolf Leggewie

Acked-by and S-o-b take an email address as well so people can start 
sending hatemail when things introduce bugs ;)

regards,

Koen



