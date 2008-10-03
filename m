Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1Klfwi-0004qT-PY; Fri, 03 Oct 2008 10:23:33 +0200
Received: from 88-109-232-232.dynamic.dsl.as9105.com ([88.109.232.232]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1Klfsb-0003Bi-9k; Fri, 03 Oct 2008 09:19:17 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gc4gla$8ho$1@ger.gmane.org>
References: <gc35ba$voi$1@ger.gmane.org>
	<1222986336.5190.33.camel@dax.rpnet.com> <gc4gla$8ho$1@ger.gmane.org>
Date: Fri, 03 Oct 2008 09:19:15 +0100
Message-Id: <1223021955.4426.151.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: Heads up: staging changes are going to land
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
X-List-Received-Date: Fri, 03 Oct 2008 08:23:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-10-03 at 09:12 +0200, Koen Kooi wrote:
> AIUI you need -fno-omit-frame-pointer on ARM to do profiling, right?

You shouldn't do; I can't think of any reason why the profile runtime
would require frame pointers.  What goes wrong without that flag?

p.




