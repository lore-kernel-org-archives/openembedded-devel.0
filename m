Received: from [66.80.197.243] (helo=looper.buglabs.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ken@buglabs.net>) id 1LXzTI-0001W6-8G
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 15:56:52 +0100
Received: from aphid.buglabs.net (aphid.buglabs.net [192.168.20.30])
	by looper.buglabs.net (Postfix) with ESMTP id BB4AA3404C;
	Fri, 13 Feb 2009 09:57:59 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by aphid.buglabs.net (Postfix) with ESMTP id 92EEE28E002;
	Fri, 13 Feb 2009 09:57:03 -0500 (EST)
X-Virus-Scanned: amavisd-new at aphid.buglabs.net
Received: from aphid.buglabs.net ([127.0.0.1])
	by localhost (aphid.buglabs.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DJBn5Og2RsZY; Fri, 13 Feb 2009 09:57:03 -0500 (EST)
Received: from [192.168.0.120] (t61.buglabs.net [192.168.0.120])
	by aphid.buglabs.net (Postfix) with ESMTP id 6118E28E001;
	Fri, 13 Feb 2009 09:57:03 -0500 (EST)
From: Ken Gilmer <ken@buglabs.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200902131525.34787.openembedded@haerwu.biz>
References: <200902131525.34787.openembedded@haerwu.biz>
Organization: Bug Labs, Inc.
Date: Fri, 13 Feb 2009 04:57:48 -0500
Message-Id: <1234519068.4866.14.camel@t61.buglabs.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: Machine config generator (FOSDEM idea)
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
X-List-Received-Date: Fri, 13 Feb 2009 14:56:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


Sounds like something I'd also like to add to OTE...

thx
ken


On Fri, 2009-02-13 at 15:25 +0100, Marcin Juszkiewicz wrote:
> Hi
> 
> I was talking during FOSDEM with some developers and one of things which 
> I was asked about was 'how to create machine config' (usually question 
> was other but had this sense).
> 
> OE developers usually know that machine config is simple but tell that 
> to Joe Random who only knows that his board use s3c2443 etc. So idea was 
> to create simple few steps wizard which will ask few questions and 
> produce machine config as result. More work would be required on 
> creating kernel recipe because kernel can be from svn/cvs/git or tarball 
> + quilt patchset etc...
> 
> Thats only beginning of idea - I hope that someone will provide 
> feedback.
> 
> Regards, 



