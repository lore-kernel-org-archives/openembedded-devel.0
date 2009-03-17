Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1LjaW5-0000yZ-2W
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 15:43:49 +0100
Received: from Powerbook-3.local (vpn006012.vpn.utwente.nl [130.89.6.12])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	n2HEgWUQ029905 for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 15:42:33 +0100
Message-ID: <49BFB6D8.5060804@student.utwente.nl>
Date: Tue, 17 Mar 2009 15:42:32 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090225 Shredder/3.0b3pre
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1237246365-32076-1-git-send-email-denis@denix.org>
In-Reply-To: <1237246365-32076-1-git-send-email-denis@denix.org>
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-SA-Exim-Connect-IP: 130.89.2.8
X-SA-Exim-Mail-From: k.kooi@student.utwente.nl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_50,
	RCVD_IN_DNSWL_LOW,RDNS_NONE autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] rename packages/ to recipes/ per earlier agreement
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
X-List-Received-Date: Tue, 17 Mar 2009 14:43:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-03-09 00:32, Denys Dmytriyenko wrote:
> Renaming packages/ directory to recipes/, as one of the several structural
> changes, was proposed by Koen[1] and agreed/approved by many. Since Koen
> currently doesn't have time/ability to do the change, and some people are
> too eager to wait any longer, he asked me to do it. Please ack/nack.
>
> [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/21326
>
> Denys Dmytriyenko (3):
>    rename packages/ to recipes/ per earlier agreement
>    recipes: fix hardcoded instances of packages/
>    base.bbclass: fix base_get_scmbasepath() to look for recipes/ and
>      fall back to packages/ while parsing BBFILES

Acked-By: Koen Kooi <koen@openembedded.org>

Now, if you use patchwork, these acks and SOBs get added to your patch 
automagically :)

regards,

Koen



