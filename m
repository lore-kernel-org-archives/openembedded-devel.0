Received: from [209.85.219.212] (helo=mail-ew0-f212.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1MaZ8A-00040K-Vl
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Aug 2009 19:57:59 +0200
Received: by ewy8 with SMTP id 8so2543867ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 10:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=mSmFYPFXSxV1mA0hrQffnjLsoHomu6iWgiHku5d03Kw=;
	b=tDc2ZtBinL1oXL0TRRPy8v0EHdh8QAOCWUiV5omeO0klQs3hM0aaitZ8WEH3Hc2Wan
	QN8MMAw/UJ9QJba07dQYdA7Any7J9DoyMLDE+Z6hwfMOVwTU+B7Vi5tIw2FmPomZu+IO
	kAV9Xm5XXhbqbo07nyN+mp6fUm5JnFbHyxE8g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=A8pwEAJ1TQULcX5NyBxy0KEJ3z1KvuZqhyZRUU1u9Oxv+sbgDoaU/Qiv2J9wUieuR8
	/s4yNbhXqe6SJw8NHKuxF2CrLCtJ0wVZ1X8UI8+orSCg1ANCT0zVMvhvHiiBOC125qB7
	e4qzjcros3pqOwllsmAw7IqtACXv/pplkXg9g=
Received: by 10.210.20.6 with SMTP id 6mr3106291ebt.73.1249926104371;
	Mon, 10 Aug 2009 10:41:44 -0700 (PDT)
Received: from ?192.168.0.7? ([94.180.23.68])
	by mx.google.com with ESMTPS id 5sm788983eyf.28.2009.08.10.10.41.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 Aug 2009 10:41:43 -0700 (PDT)
Message-ID: <4A805BF0.8050805@gmail.com>
Date: Mon, 10 Aug 2009 23:42:08 +0600
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Building OE for LPC3250
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
X-List-Received-Date: Mon, 10 Aug 2009 17:57:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I work with ARM9 Phytec LPC3250 RDK now and decided to try using OE as 
building system for my project (hard real-time, industrial). Have 
anybody among OE developers worked with this board earlier?

Thanks in advance.

-- 
Best Regards, 
Dmitry Vinokurov 
<d.vinokuroff@gmail.com>



