Return-Path: <prvs=744399394=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id AF46776F58
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:44:06 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqkEALRcO1asEApK/2dsb2JhbABehQO/b4M+glQCgXoBAQEBAQGBC4Q2AQEEeBELDQsJFg8JAwIBAgFFBg0IAogvwgABAQEHAiGGVIR+hSeEEgEElkiWPheTEIRohQmBBwEBAQ
X-IPAS-Result: AqkEALRcO1asEApK/2dsb2JhbABehQO/b4M+glQCgXoBAQEBAQGBC4Q2AQEEeBELDQsJFg8JAwIBAgFFBg0IAogvwgABAQEHAiGGVIR+hSeEEgEElkiWPheTEIRohQmBBwEBAQ
Message-ID: <563B5CE1.4060808@skidata.com>
Date: Thu, 5 Nov 2015 14:42:57 +0100
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <563B5C7B.6090204@mlbassoc.com>
In-Reply-To: <563B5C7B.6090204@mlbassoc.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java] where is javac on the target
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Nov 2015 13:44:10 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Hi,
it should be included in the openjdk-7-jdk package.

kind regards,
Richard L

On 11/05/2015 02:41 PM, Gary Thomas wrote:
> I tried running the java-test-image from this layer and found
> lots of .java files, but no javac compiler.
> 
> Looking at the recipe for openjdk-7-jre I can see javac built,
> but it doesn't seem to be packaged.
> 
> Am I missing something?  How can I get the java compiler on my
> target?
> 
> Thanks
> 

