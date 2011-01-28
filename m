Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PiwmN-0000wG-VV
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 23:26:57 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PiwlZ-0005M3-GZ from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 14:26:05 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 28 Jan 2011 14:26:03 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 28 Jan 2011 15:26:01 -0700
Message-ID: <4D434272.9090403@mentor.com>
Date: Fri, 28 Jan 2011 15:25:54 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinTV+FMDzCSQKGjB81LGgp4L8eyceusVNs4CWCL@mail.gmail.com>
In-Reply-To: <AANLkTinTV+FMDzCSQKGjB81LGgp4L8eyceusVNs4CWCL@mail.gmail.com>
X-OriginalArrivalTime: 28 Jan 2011 22:26:01.0918 (UTC)
	FILETIME=[5836B5E0:01CBBF3A]
Subject: Re: testing branch 2011-01-28
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
X-List-Received-Date: Fri, 28 Jan 2011 22:26:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/28/2011 07:30 AM, Cliff Brake wrote:
> master has been merged to testing-next and is ready for clean builds.

Need 
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=dd33ced4b8123600efa1f67f704aec13b0842ad1 
for most of my autobuilder now that python-pygobject-native is pulled in 
(it looks like just minimal-image and meta-toolchain will pass in my 
matrix, on this weeks branch, will update once all done).

-- 
Tom Rini
Mentor Graphics Corporation


