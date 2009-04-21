Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1LwN30-0005R8-N7
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Apr 2009 22:58:30 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id DC290DB0E1C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 22:54:03 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 14B81DB07A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 22:54:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (g225145114.adsl.alicedsl.de
	[92.225.145.114]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 22:54:03 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 5A4573C244; Tue, 21 Apr 2009 22:54:02 +0200 (CEST)
Date: Tue, 21 Apr 2009 22:54:02 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090421205401.GA6560@rhein.zuhause.netz>
References: <20090421161342.GA5630@rhein.zuhause.netz>
	<gsl2ps$q6k$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gsl2ps$q6k$1@ger.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Ack for ffmpeg patch
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
X-List-Received-Date: Tue, 21 Apr 2009 20:58:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2009 at 08:20:44PM +0200, Koen Kooi wrote:
> On 21-04-09 18:13, Henning Heinold wrote:
>> Hi,
>>
>> is the attached patch okay for dev. The patch removes the install
>> of the headers to the legacy directories. Without the patch it is very complicated
>> to compile xine 1.1.16.3.
>
> NACK, it installs to both for a reason. You'll break other ffmpeg  
> dependants by removing them. I don't think that's worth it to make xine  
> work.
>
> regards,
>
> Koen

Which one breaks? Then they have to be fixed.

Bye Henning


