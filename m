Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNcE7-0008Tz-TD
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 02:10:55 +0100
Received: by pwi18 with SMTP id 18so4664614pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2009 17:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:subject:date:to
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=9Has2xmXu0sCwJmwT9EGaeETXgCevwKpeginLWouNCw=;
	b=FO7MPTC/NndiRazx7c8r/156geQmflAZ6EGPIH12nhpr/As5yYQINELM95v7Zr7C46
	4ZQIinYWjoYuz6kG/2ZbZd4IVKYn+1VvbjS3FHSmXwyrDXBZ31KkgIW2kKMJRKu9sN2q
	o2PdjRsyeKkm8IYPxQgP3vESs3OCssjp3KTic=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:subject:date:to:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=g+mF/bIqWlbZxu8SQGVUBSotAduU0F4rPocy3iI9961AXGGi4LcYkBp8tyWduR/tnu
	v32yljTAoMTDeqGKOgpfA59f/92uuJqqJccpoOrbv3Zi17YKBuEPF8RxTUahiXfB722z
	O/tn6CIfPS9s/ZfPN9GEjKoYnuV6e0VW0JSMA=
Received: by 10.140.55.21 with SMTP id d21mr7632724rva.26.1261616935930;
	Wed, 23 Dec 2009 17:08:55 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.101])
	by mx.google.com with ESMTPS id 23sm7329077pzk.0.2009.12.23.17.08.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Dec 2009 17:08:55 -0800 (PST)
Date: Thu, 24 Dec 2009 09:08:48 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5e34zgkmn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: how can I upload my OE building failure information and log to tinderbox of OE
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
X-List-Received-Date: Thu, 24 Dec 2009 01:10:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
    Sometimes, I encountered a failure when building openembedded. But I  
always forget to collect the log and the configuration files for the  
failure. It will take me lots of time to reproduce it and send it to  
openembedded-devel maillist. Is there any method to collect the failure  
information and sent it to tinderbox automotively.
    By the way, does classes/tinderclient.bbclass address this problem?

Thanks a lot!

http://tinderbox.openembedded.net/

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


