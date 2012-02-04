Received: from mx2.promwad.com ([195.222.87.218])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Ivan.Kuten@promwad.com>) id 1RtkOv-0007yq-7C
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 19:31:53 +0100
Received: from [192.168.13.10] (86.57.150.112) by sv-exmb01-lo1.promwad.corp
	(192.168.10.44) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Sat, 4 Feb 2012 21:23:47 +0300
Message-ID: <4F2D77AE.7060505@promwad.com>
Date: Sat, 4 Feb 2012 21:23:42 +0300
From: Ivan Kuten <ivan.kuten@promwad.com>
Organization: Promwad
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4F2C6842.1040907@promwad.com>
	<20120204022129.GC26306@sakrah.homelinux.org>
In-Reply-To: <20120204022129.GC26306@sakrah.homelinux.org>
X-Enigmail-Version: 1.1.1
Cc: nitin.a.kamble@intel.com
Subject: Re: Java: meta-java, meta-oracle-java
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
X-List-Received-Date: Sat, 04 Feb 2012 18:31:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

I meant isn't it going to be something like that in local.conf :
PREFERRED_PROVIDER_virtual/java = "oracle-jre"
PREFERRED_PROVIDER_virtual/java = "openjdk"
in a single meta-java layer...

Regards,
Ivan

On 02/04/2012 05:21 AM, Khem Raj wrote:
> On (04/02/12 02:05), Ivan Kuten wrote:
>> Hello,
>>
>> I noticed an activity around meta-java layer (OpenJDK based)
>> https://github.com/woglinde/meta-java
>> and recently around Oracle JRE: http://git.yoctoproject.org/cgit/cgit.cgi/meta-oracle-java/
>>
>> Any plans to combine or coordinate these efforts?
> these are two different layers so they will exist. What coordination
> would you like to see that will help you
>



