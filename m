Received: from [64.233.166.177] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1JKnOw-0005Sk-Ua
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Feb 2008 05:21:20 +0100
Received: by py-out-1112.google.com with SMTP id y77so944111pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2008 20:21:27 -0800 (PST)
Received: by 10.35.60.15 with SMTP id n15mr3344014pyk.33.1201839686824;
	Thu, 31 Jan 2008 20:21:26 -0800 (PST)
Received: from ?192.168.1.207? ( [24.107.189.117])
	by mx.google.com with ESMTPS id y64sm3239143pyg.22.2008.01.31.20.21.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 31 Jan 2008 20:21:26 -0800 (PST)
Message-ID: <47A29E42.8020504@gmail.com>
Date: Thu, 31 Jan 2008 22:21:22 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: angstrom-distro-devel@linuxtogo.org
References: <47A05B52.6000202@gmail.com>	<200801301223.17721.openembedded@haerwu.biz>	<47A06C1C.10205@gmail.com>
	<200801301711.44503.openembedded@haerwu.biz>
In-Reply-To: <200801301711.44503.openembedded@haerwu.biz>
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [Angstrom-devel] [RFC] add kernel-module-loop to roofs for collie and tosa
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2008 04:21:20 -0000
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2008 10:11 AM, Marcin Juszkiewicz wrote:
> Users does not have to go and find it. OE will take care of it and 
> installing altboot into image will also adds kernel-module-loop package. 
> Thats how dependencies works.
> 
> 
> RRECOMMENDS is proper for kernel modules as it does not break if package 
> is not available (which is a case when loop is in kernel not module).
> 

Thanks. If CoreDump doesn't object, I will add kernel-module-loop as an 
RRECOMMENDS to altboot recipies.

Regards
Gordon


