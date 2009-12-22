Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NN0XE-0001Tw-Pw
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Dec 2009 09:56:07 +0100
Received: by ywh26 with SMTP id 26so5968999ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2009 00:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:date:subject
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=AL8Q1AuiO5NCCcbJX/uQoqj9azN9vLwo2QfKSjGE+os=;
	b=mPfC51NMiyKBduS9pKqHy79H7HJqbdh6qKP2yi1U5fXOWJPPgddK8Z+3sjPlgV/7Yi
	FQLrq9Q9ga+n/BwGWVy0BGTnl7W8eHTWVWQR6zJQBbni6wVbFeTKpehP3lMy1AtUgB6t
	vAfG7qrxd6/u+w0ZDb1wwDxaPkh/hTmHr/7mE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:date:subject:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=N8789aJ3cR+SJ4hJVYwAemPUm7LGvQm3+DFr8aaJRVFrLApRrAcfoX8pktv8U2zJiE
	HfbYmb7Twt5UWOnuyQLiRVhxfuS944nwMnHYbZ785FVj/k5rBr8iHJBABaLfGlfYRTuu
	RXL+GQmYig6hpdPDlngS8U+VR08ejrS1kbjtM=
Received: by 10.100.50.37 with SMTP id x37mr12982689anx.182.1261472052517;
	Tue, 22 Dec 2009 00:54:12 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.206])
	by mx.google.com with ESMTPS id 21sm5337728iwn.10.2009.12.22.00.54.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 22 Dec 2009 00:54:12 -0800 (PST)
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Dec 2009 16:54:02 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5b0cczimn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.188
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: why rootfs directory in temp is empty
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
X-List-Received-Date: Tue, 22 Dec 2009 08:56:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   Today, I build an base-image using OE. And I want to check the content  
of rootfs, but I found the directory rootfs in building directory is  
empty. I remember there was the ontent of the target root filesystem. Why  
have to remove them? Does it means the rootfs directory is unuseful?

Thanks a lot!

-- 
Guo Hongruan, Embedded Linux Consultant
Mobile: +86-0-13484056007
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


