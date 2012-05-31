Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sa8nA-0003o1-Hb
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 19:04:08 +0200
Received: by wibhm14 with SMTP id hm14so1018127wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 09:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=CzN6sln08LQJ8xdzyLsr1ldxn9SsUQ+CHKqE65UnRlc=;
	b=nmsvrQCLT7ABj+qBPY9ZEEYw/rQGjfvN19EVW9vGPNwRkD95cstBROCaDVDxeyXDYG
	ZnUmc5ppvBqp/K8ZvhiN+z96kDLi6Zoy+b1UhM1hTpVscTj6fAZvRalCjOjVlagd7Kkc
	lQKZYGOJBNsM1qOThLmGVuF3AfJyAlM4xxC7HBLje9tU6V8IouKftu2ISfXmWbjk+fHK
	xha04o4bK29eCQNpsTsNNmygiwwzY2S7GP7hhwnTvRunArnw64NT7/huC4chQ/Vq88an
	YH5jIYvKFA5QywNTLCChm/3XtU2sPr7Hwxnh8vFnVz3HqCI7qoUvVYu7kizDW8WTLHmv
	S9Kg==
Received: by 10.216.140.2 with SMTP id d2mr10142166wej.0.1338483227527;
	Thu, 31 May 2012 09:53:47 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id k8sm7923878wia.6.2012.05.31.09.53.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 09:53:46 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAAB-1ywGdhaePDp05Cmm90NtGVSUPbRqGtRtO2XkVMd9NnK+Gg@mail.gmail.com>
Date: Thu, 31 May 2012 18:53:49 +0200
Message-Id: <2729A91D-A5DA-4BD7-8F6F-64D8EFC12DE5@gmail.com>
References: <1338445392-39723-1-git-send-email-elvis.dowson@gmail.com>
	<CAAB-1ywGdhaePDp05Cmm90NtGVSUPbRqGtRtO2XkVMd9NnK+Gg@mail.gmail.com>
To: Adrian Alonso <aalonso00@gmail.com>
X-Mailer: Apple Mail (2.1278)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xilinx] tune-ppc440.inc: Update support for the PowerPC 440 processor in the Xilinx Virtex-5 FXT FPGA.
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
X-List-Received-Date: Thu, 31 May 2012 17:04:08 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Hi Adrian,

On May 31, 2012, at 5:15 PM, Adrian Alonso wrote:

> Please update your meta-xilinx repo,
> commit: 04633e44b5401288ceee2d36eb2413dfa5308a54
> does something similar, but I fail to use "powerpc-nf"
> 
> I would accept a new patch for that :)

Done! :-)

Best regards,

Elvis Dowson



