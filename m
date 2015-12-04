Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3F76260132
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2015 13:54:41 +0000 (UTC)
Received: by wmww144 with SMTP id w144so65789411wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2015 05:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:date:in-reply-to:references:content-type
	:mime-version:content-transfer-encoding;
	bh=Vc82hfFfV+WLdIOn/fXbPC1GAmAhy8g5xtiefnBuaP4=;
	b=Fn3p06QYM4ErIPSc8/KxFLyru4nGM8WAJ+8bJvSDVRFSs/NxfDEqUA2DbN8kBl78WP
	zBkNIR6AzjpxRJJOz/Pir8CAbfzDXJ7xXWEwxtY11hYuXg8AGQKs/H1lNFe/GoGWqD8K
	/fywFhcQXbuaLd0GZ65p/xSvCZ3AD6dzJkcHk3T1lNe+whECDaqMRZMbi9pY2NlCi26I
	Z6Yxv2z+bmSPfyD8sdpwSspI8sYvtR6CJ/QRtXjV5WU+QIEaa8HOixoHe/qOBGZO9RO1
	HIjjTzJKlH+dZgbGFOTBKpBYzYRG2wugrUmZjJ+haNGBlhdz2RrCnVPz6jGk4VYQeGuw
	74sQ==
X-Received: by 10.28.142.83 with SMTP id q80mr5544971wmd.66.1449237281877;
	Fri, 04 Dec 2015 05:54:41 -0800 (PST)
Received: from [192.168.0.7] (212-41-103-249.adsl.solnet.ch. [212.41.103.249])
	by smtp.gmail.com with ESMTPSA id
	w4sm12215251wje.49.2015.12.04.05.54.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Dec 2015 05:54:39 -0800 (PST)
Message-ID: <1449237278.2313.15.camel@Saturn.local.all>
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 04 Dec 2015 14:54:38 +0100
In-Reply-To: <56613B9A.7050406@windriver.com>
References: <56613B9A.7050406@windriver.com>
X-Mailer: Evolution 3.10.4 
Mime-Version: 1.0
Subject: Re: Is git.openembedded.org down ?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Dec 2015 13:54:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

Am Freitag, den 04.12.2015, 15:07 +0800 schrieb Robert Yang:
$ ping git.openembedded.org doesn't work.
> 
Works for me.

mk@Saturn:~> date
Fre Dez  4 14:48:13 CET 2015

mk@Saturn:~/tmp> ping -c 1 git.openembedded.org
PING opal.openembedded.org (140.211.169.152) 56(84) bytes of data.
64 bytes from opal.openembedded.org (140.211.169.152): icmp_seq=1 ttl=45
time=207 ms

--- opal.openembedded.org ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 207.014/207.014/207.014/0.000 ms

Also access with git and cgit web frontend works.

Max


