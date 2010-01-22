Received: from mail-gx0-f227.google.com ([209.85.217.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYDVZ-0006Wv-C2
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 08:00:45 +0100
Received: by gxk27 with SMTP id 27so829466gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 22:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:subject:date:to
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=abAHgp0D+akFpUv4kD5ajoU1vKdV+6HblFdqk/Emd1Q=;
	b=jMtxlSYCdpTlj1UhmDqEogqGFBoMFYAPkzFWoAy9mo9Fbpp3BqsbWO5YXMXNCb/3Ne
	dVKWxEdK8GkCZKGSwlBDvDiAQAX+hw7uG5A53RbBAKjt/2DJFqj62fZIn/+w3KzjEbur
	YLe0wwoN8R2cGZ/dxeveN8O2CqO97WzhmJcfU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:subject:date:to:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=XZU5Bfg6u1FQl+q6XSP7d+h2ACxb16xu8+xUbj5YlEDGMW6yBEL1xslU6ZjFglcgyN
	HA8+I6Bx0KgidtgJSImtufP+x2K16/SpF1Ms1AyyQpMPjSTitu2kPazg4K0pfTA85WKT
	iSIWdNYTuPLRDmawEMzE8KHt2tJmHUa9s+tIw=
Received: by 10.100.243.37 with SMTP id q37mr3302265anh.164.1264143498758;
	Thu, 21 Jan 2010 22:58:18 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.84])
	by mx.google.com with ESMTPS id 4sm701781ywg.13.2010.01.21.22.58.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Jan 2010 22:58:18 -0800 (PST)
Date: Fri, 22 Jan 2010 14:58:06 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6w9m4x2mn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: how to generate files in site directory
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
X-List-Received-Date: Fri, 22 Jan 2010 07:00:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I am trying to build an openembedded project for sparc machine. But I  
found the file for spare in site directory are not complete at all. I want  
to know whether or not there is some standard method to generate site file  
or I must write it by hand.

Thanks a lot!
-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


