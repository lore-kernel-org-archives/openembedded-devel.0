Received: from mail.kernelconcepts.de ([212.60.202.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1ROnSX-0001yi-Dh
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 10:31:41 +0100
Received: from [192.168.2.131] by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1ROnlD-0007AW-LA
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 10:50:59 +0100
Message-ID: <4EBCE9FB.9030002@kernelconcepts.de>
Date: Fri, 11 Nov 2011 10:25:15 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EBBF280.30301@freyther.de>	<1320945711.21488.21.camel@phil-desktop>	<j9hbqb$b8u$1@dough.gmane.org>	<1320959262.3080.11.camel@lenovo.internal.reciva.com>
	<j9iooh$q1p$1@dough.gmane.org>
In-Reply-To: <j9iooh$q1p$1@dough.gmane.org>
X-Enigmail-Version: 1.1.2
Subject: Re: RFC Creation of a meta-telephony repository
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
X-List-Received-Date: Fri, 11 Nov 2011 09:31:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Am 11.11.2011 10:09, schrieb Koen Kooi:
>> I don't recall any general requirement that one needs to seek permission 
>> from the TSC before acting on what seems like essentially a minor 
>> operational matter.  When did this become the policy?
> 
> Ever since the TSC has been formed. You never noticed it since the second
> TSC was so shockingly passive.

the job of the TSC is sketched in the TSC Charter like this:
"To govern access to all technical aspects of OpenEmbedded, this includes
official git trees, openembedded-devel mailing list, bug trackers, QA systems,
and others as the TSC sees fit."

In this context my interpretation would be that the TSC grants permissions for
write access to the Git tree but nothing more. And further control related to
the responsible use of Git is not defined and IMHO never was. Phil has the
required permissions to create a layer, so why he would have to ask?

If there are really members out there who interpret this sentence as "you have
to ask the TSC for everything related to use of the Git server" we need to
discuss the charter again. If we do not make this more clear it won't take long
and someone steps up claiming that the TSC would have to accept any single
commit :-/

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en


