Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UT84Y-00062F-3W
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 11:57:42 +0200
Message-ID: <517110F2.5010205@communistcode.co.uk>
Date: Fri, 19 Apr 2013 10:40:02 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: Jack Mitchell <ml@communistcode.cuk>
References: <1366363735-31656-1-git-send-email-ml@communistcode.cuk>
In-Reply-To: <1366363735-31656-1-git-send-email-ml@communistcode.cuk>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/2 v3]
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
X-List-Received-Date: Fri, 19 Apr 2013 09:57:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/13 10:28, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> These changes are on top of Marcin's PHP 5.4.14 upgrade
>
> Jack Mitchell (2):
>    php: add sqlite3 and mysql PACKAGECONFIG options
>    php: remove non-existant configure flags and improve current ones
>
>   meta-oe/recipes-devtools/php/php.inc | 38 +++++++++++++++++++++++-------------
>   1 file changed, 24 insertions(+), 14 deletions(-)
>

Sorry these patches are broken; php-native compiles fine, but now php 
fails with the same error as php-native used to have!

Attempting a v4 (with subject this time!).

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



