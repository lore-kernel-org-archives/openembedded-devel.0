Received: from [17.148.16.86] (helo=asmtpout011.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGAuw-0003Dw-7B
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Jun 2009 14:04:02 +0200
MIME-version: 1.0
Received: from [87.201.169.122] by asmtp011.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLA00EXN3OR9500@asmtp011.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	15 Jun 2009 04:53:20 -0700 (PDT)
Message-id: <3D252141-B21F-4EA8-BFED-D6902C328155@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: Elvis Dowson <elvis.dowson@mac.com>
In-reply-to: <ED279EA4-A74C-42B1-83A8-6D0B470A98E7@mac.com>
Date: Mon, 15 Jun 2009 15:53:05 +0400
References: <ED279EA4-A74C-42B1-83A8-6D0B470A98E7@mac.com>
X-Mailer: Apple Mail (2.935.3)
Cc: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Subject: Re: How to get rxtx recipe to work
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
X-List-Received-Date: Mon, 15 Jun 2009 12:04:03 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	I get errors while build rxtx, so I was wondering to start with,  
which of the following providers should I be using to get it to work  
properly. Here is the first set of messages that I get:

NOTE: multiple providers are available for virtual/javac-native (ecj- 
bootstrap-native, openjdk-javac-native);
NOTE: consider defining PREFERRED_PROVIDER_virtual/javac-native
NOTE: multiple providers are available for classpath (classpath,  
classpath-minimal);
NOTE: consider defining PREFERRED_PROVIDER_classpath
NOTE: multiple providers are available for virtual/java-native (cacao- 
native, jamvm-native);
NOTE: consider defining PREFERRED_PROVIDER_virtual/java-native
NOTE: multiple providers are available for virtual/java-initial (cacao- 
initial, jamvm-initial);
NOTE: consider defining PREFERRED_PROVIDER_virtual/java-initial


Best regards,

Elvis

On Jun 15, 2009, at 3:12 PM, Elvis Dowson wrote:

> Hi,
> 	What are the recommended settings for the following preferred  
> providers for using the rxtx recipe?
>
> I have set the following, are they okay?
>
> PREFERRED_PROVIDER_virtual/javac-native = "openjdk-javac-native"
> PREFERRED_PROVIDER_classpath = "classpath"
> PREFERRED_PROVIDER_virtual/java-initial = "jamvm-initial"
> PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
>
>
> Elvis
>
>



