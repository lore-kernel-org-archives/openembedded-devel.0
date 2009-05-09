Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M2hWE-0006wD-NH
	for openembedded-devel@openembedded.org; Sat, 09 May 2009 10:02:50 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M2hQ9-00083a-Hp
	for openembedded-devel@openembedded.org; Sat, 09 May 2009 07:56:33 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 09 May 2009 07:56:33 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 09 May 2009 07:56:33 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 09 May 2009 09:56:19 +0200
Message-ID: <gu3cv5$7qi$1@ger.gmane.org>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>	<1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090427 Shredder/3.0b3pre
In-Reply-To: <1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 09/23] system-config-printer: add to provide python-cupshelpers to hal-cups-utils
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
X-List-Received-Date: Sat, 09 May 2009 08:02:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09-05-09 02:50, Otavio Salvador wrote:

> +PACKAGES="python-cupshelpers"

Overwriting PACKAGES is always a bug.

regards,

Koen



